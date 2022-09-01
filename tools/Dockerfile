from python:3.10

ADD requirements.txt /
RUN pip install -r /requirements.txt

RUN mkdir /docs
ADD zendesk_federated_search_content_sync.py /

VOLUME /docs
WORKDIR /docs

ENTRYPOINT ["/zendesk_federated_search_content_sync.py"]
