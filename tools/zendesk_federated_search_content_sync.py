#!/usr/bin/env python3

import argparse
import hashlib
import json
import logging
import os
import sys

from typing import List

import requests
from requests.auth import HTTPBasicAuth

import tqdm
import yaml

ZD_MAX_KEY_LENGTH = 32


class Zendesk:
    def __init__(self, user, token, domain):
        self._token = token
        self._user = user
        self._url_base = f'https://{domain}.zendesk.com/api/'
        self._content_types = {}

    def _get(self, path):
        auth = HTTPBasicAuth(self._user, self._token)
        url = self._url_base + path
        rv = requests.get(url, auth=auth)
        if rv.status_code != 200:
            rv.raise_for_status()
        return rv.json()

    def _post(self, path, body, content_type='application/json'):
        auth = HTTPBasicAuth(self._user, self._token)
        url = self._url_base + path
        rv = requests.post(
            url,
            auth=auth,
            headers={'Content-Type': content_type},
            data=json.dumps(body),
        )
        if rv.status_code != 201:
            rv.raise_for_status()
        return

    def _put(self, path, body, content_type='application/json'):
        auth = HTTPBasicAuth(self._user, self._token)
        url = self._url_base + path
        rv = requests.put(
            url,
            auth=auth,
            headers={'Content-Type': content_type},
            data=json.dumps(body),
        )
        if rv.status_code != 200:
            rv.raise_for_status()
        return rv.json()

    def _delete(self, path, content_type='application/json'):
        auth = HTTPBasicAuth(self._user, self._token)
        url = self._url_base + path
        rv = requests.delete(url, auth=auth, headers={'Content-Type': content_type})
        if rv.status_code != 204:
            rv.raise_for_status()
        return

    def content_types(self):
        return self._get('v2/guide/external_content/types')['types']

    def content_sources(self):
        return self._get('v2/guide/external_content/sources')['sources']

    def get_content_type(self, type_name):
        all_types = self.content_types()
        for rec in all_types:
            if rec['name'] == type_name:
                return rec

    def get_content_source(self, type_name):
        all_sources = self.content_sources()
        for rec in all_sources:
            if rec['name'] == type_name:
                return rec

    def records(self):
        records = []
        base_url = 'v2/guide/external_content/records'
        url = base_url
        while url:
            rv = self._get(url)
            records.extend(rv['records'])

            if rv['meta'].get('has_more'):
                url = base_url + f'?page[after]={rv["meta"]["after_cursor"]}'
            else:
                url = None
        return records

    def delete_external_record(self, id_):
        self._delete(f'v2/guide/external_content/records/{id_}')

    def update_external_record(self, id_, record):
        payload = {'record': record.to_dict()}
        self._put(f'v2/guide/external_content/records/{id_}', payload)

    def add_external_record(self, record):
        payload = {'record': record.to_dict()}
        self._post(f'v2/guide/external_content/records', payload)


class ExternalRecord:
    def __init__(
        self,
        type_id,
        source_id,
        url,
        title,
        body,
        id_=None,
        key=None,
        keywords='',
        locale='en-us',
        key_prefix='zd_',
    ):
        self.id_ = id_
        self.key = key

        if key is None:
            m = hashlib.blake2b(
                key=key_prefix.encode(),
                digest_size=int((ZD_MAX_KEY_LENGTH - (len(key_prefix) + 1)) / 2),
            )
            m.update(url.encode())
            self.key = f'{key_prefix}_{m.hexdigest()}'

        self.type_id = type_id
        self.source_id = source_id
        self.url = url
        self.title = title
        self.body = self.ensure_body_length(body)  # body
        # if keywords:
        #    self.body = '{0:<120} {1}'.format(
        #        self.ensure_body_length(self.body), keywords
        #    )
        self.locale = locale

    @staticmethod
    def ensure_body_length(txt):
        txt = txt.strip()
        if len(txt) > 120:
            return txt[:117] + '...'
        return txt

    def to_dict(self):
        return {
            'body': self.body,
            'external_id': self.key,
            'locale': self.locale,
            'title': self.title,
            'type_id': self.type_id,
            'source_id': self.source_id,
            'url': self.url,
        }

    def __eq__(self, other):
        # Ignore id_ since that's a Zendesk value
        return (
            self.body == other.body
            and self.key == other.key
            and self.locale == other.locale
            and self.title == other.title
            and self.type_id == other.type_id
            and self.source_id == other.source_id
            and self.url == other.url
        )

    def diff(self, other):
        changes = []
        if self.body != other.body:
            changes.append(f'Body: \n   {self.body}\nvs\n   {other.body}')
        if self.url != other.url:
            changes.append(f'Url: {self.url} vs {other.url}')
        if self.key != other.key:
            changes.append(f'Key: {self.key} vs {other.key}')
        if self.title != other.title:
            changes.append(f'Title: {self.title} vs {other.title}')
        return '\n'.join(changes)

    def __hash__(self):
        return hash(
            self.key,
        )

    def __repr__(self):
        return str(self.to_dict())

    def __str__(self):
        return f'---\nid: {self.id_}\nexternal_id: {self.key}\nurl: {self.url}\ntitle: {self.title}\nbody: {self.body}\n'


def with_leading_slash(txt):
    if txt[0] != '/':
        return f'/{txt}'
    return txt


def parse_markup_document(path, default_type_id, source_ids, default_key_prefix):
    with open(path, 'r') as f:
        try:
            docs = yaml.safe_load_all(f)
            doc = next(docs)

            if not doc.get('permalink'):
                return None

            if doc.get('redirect_to'):
                return None

            # Check whether the Admin Guide is for Azure or On-Prem
            sidebar = doc.get('sidebar')
            title_prefix = ''
            if sidebar == 'azure_administrator_guide_sidebar':
                title_prefix = 'Azure: '
            elif sidebar == 'administrator_guide_sidebar':
                title_prefix = 'On-Prem: '

            source_id = (
                source_ids.get(doc.get('zendesk_source')) or source_ids['__DEFAULT__']
            )

            return ExternalRecord(
                type_id=default_type_id,
                source_id=source_id,
                url=f'https://docs.qumulo.com{with_leading_slash(doc["permalink"])}',
                title=title_prefix + doc['title'],  # Add prefix to the title
                body=doc['summary'],
                keywords=doc.get('keywords'),
                key_prefix=default_key_prefix,
            )

        except:
            return None


def get_documents(
    document_root: str, type_id: str, source_id: str, default_key_prefix: str
) -> List:
    documents = []
    for root, dirs, files in os.walk(document_root):
        for f in files:
            if f.endswith('.md'):
                documents.append(os.path.join(root, f))

    records = []
    for d in documents:
        r = parse_markup_document(d, type_id, source_id, default_key_prefix)
        if r is not None:
            records.append(r)

    return records


def get_zendesk_documents(zd: Zendesk):
    all_records = zd.records()

    records = []
    for rec in all_records:
        new_record = ExternalRecord(
            type_id=rec['type']['id'],
            source_id=rec['source']['id'],
            url=rec['url'],
            title=rec['title'],
            body=rec['body'],
            key=rec['external_id'],
            id_=rec['id'],
        )
        if new_record is not None:
            records.append(new_record)
        else:
            print(rec)

    return records


def parse_args(args: List[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--document-root',
        default='.',
        help='Directory to start enumerating documents at',
        type=str,
    )
    parser.add_argument(
        '--commit',
        action='store_true',
        default=False,
        help='Apply the detected changes to the Zendesk Federated Search API',
    )
    parser.add_argument(
        '--verbose',
        action='store_true',
        default=False,
        help='List all documents, including unchanged documents, during summary',
    )

    return parser.parse_args(args)


def main(args: argparse.Namespace):
    ZENDESK_DOMAIN = os.environ.get('ZENDESK_DOMAIN', 'qumulo')
    ZENDESK_USER = os.environ.get('ZENDESK_USER', 'mkhmelnitsky@qumulo.com/token')
    ZENDESK_TOKEN = os.environ.get('ZENDESK_TOKEN')
    ZENDESK_PREFIX = os.environ.get('ZENDESK_PREFIX', 'git_prd')
    if ZENDESK_TOKEN is None:
        raise Exception('Missing ZENDESK_TOKEN')

    zd = Zendesk(user=ZENDESK_USER, token=ZENDESK_TOKEN, domain=ZENDESK_DOMAIN)

    type_id = zd.get_content_type('Topic').get('id')

    # Build our mapping of zendesk content sources by the name
    source_ids = {src['name']: src.get('id') for src in zd.content_sources()}
    source_ids['__DEFAULT__'] = source_ids['Documentation Portal']

    local_documents = {
        k.key: k
        for k in get_documents(args.document_root, type_id, source_ids, ZENDESK_PREFIX)
    }

    remote_documents = {k.key: k for k in get_zendesk_documents(zd)}

    documents_to_add = set()
    documents_to_update = set()

    no_changes = set()

    for key, d in local_documents.items():
        if key in remote_documents:
            if d == remote_documents[key]:
                no_changes.add(d)
            else:
                # Pull in the remote identifier
                d.id_ = remote_documents[key].id_
                documents_to_update.add(d)
        else:
            documents_to_add.add(d)

    documents_to_delete = set(
        remote_documents[d] for d in remote_documents if d not in local_documents
    )

    print('Document summary')
    print(f'Documents to add: {len(documents_to_add)}')
    print(f'Documents to delete: {len(documents_to_delete)}')
    print(f'Documents to update: {len(documents_to_update)}')

    print('ADD')
    for rec in documents_to_add:
        print(rec)

    print('DELETE')
    for rec in documents_to_delete:
        print(rec)

    print('UPDATE')
    for rec in documents_to_update:
        print(rec)

    if args.verbose:
        print('NO_CHANGES')
        for rec in no_changes:
            print(rec)

    if args.commit:
        for rec in tqdm.tqdm(documents_to_delete, desc='Deleting', unit='docs'):
            zd.delete_external_record(rec.id_)
        for rec in tqdm.tqdm(documents_to_update, desc='Updating', unit='docs'):
            zd.update_external_record(rec.id_, rec)
        for rec in tqdm.tqdm(documents_to_add, desc='Adding', unit='docs'):
            zd.add_external_record(rec)

    return 0


if __name__ == '__main__':
    opts = parse_args(sys.argv[1:])
    sys.exit(main(opts))
