#!/usr/bin/env python3
import os, datetime, xml.etree.ElementTree as ET, sys

SITE_URL = "https://docs.qumulo.com"
ROOT = "_site"
SITEMAP_PATH = os.path.join(ROOT, "sitemap.xml")

# Check for _site directory
if not os.path.isdir(ROOT):
    print(f"Could not find the `{ROOT}` directory. Build the documentation first.")
    sys.exit(1)

# Gather HTML files
html_files = []
for dirpath, _, files in os.walk(ROOT):
    for f in files:
        if f.endswith(".html") and f != "404.html" and f != "agent.html":
            html_files.append(os.path.join(dirpath, f))

if not html_files:
    print(f"Could not find HTML files in the `{ROOT}` directory. Build the documentation first.")
    sys.exit(1)

urlset = ET.Element(
    "urlset",
    {
        "xmlns": "http://www.sitemaps.org/schemas/sitemap/0.9",
        "xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
        "xsi:schemaLocation": "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd",
    },
)

for path in sorted(html_files):
    rel = os.path.relpath(path, ROOT)
    url = ET.SubElement(urlset, "url")
    ET.SubElement(url, "loc").text = f"{SITE_URL}/{rel.replace(os.sep, '/')}"
    ts = datetime.datetime.fromtimestamp(os.path.getmtime(path), datetime.timezone.utc)
    ET.SubElement(url, "lastmod").text = ts.strftime("%Y-%m-%dT%H:%M:%S%:z")
    ET.SubElement(url, "changefreq").text = "weekly"
    pr = ET.SubElement(url, "priority")
    pr.text = "1.0" if rel == "index.html" else "0.5"

ET.indent(urlset, space="  ")

with open(SITEMAP_PATH, "wb") as f:
    f.write(b'<?xml version="1.0" encoding="UTF-8"?>\n')
    ET.ElementTree(urlset).write(f, encoding="utf-8")

print("sitemap.xml generated successfully.")

