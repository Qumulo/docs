import os
import re

site_dir = '_site'

# 1. Check if _site exists and is not empty
if not os.path.exists(site_dir) or not os.listdir(site_dir):
    print("_site is empty. Rebuild the documentation.")
    exit()

# Matches <code...>...</code> and <pre...>...</pre> blocks
code_block_pattern = re.compile(
    r'<code[^>]*>[\s\S]*?</code>|<pre[^>]*>[\s\S]*?</pre>',
    re.IGNORECASE
)

# Matches &amp;&lt; followed by any amount of text (including newlines) up to &amp;&gt;
entity_pair_pattern = re.compile(r'&amp;&lt;[\s\S]*?&amp;&gt;')

matching_files = []
html_files_found = False

# 2. Search recursively inside _site for .html files
for root, _, files in os.walk(site_dir):
    for file in files:
        if file.endswith('.html'):
            html_files_found = True
            filepath = os.path.join(root, file)
            
            with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
            
            for block in code_block_pattern.finditer(content):
                text = block.group(0)
                if entity_pair_pattern.search(text):
                    matching_files.append(filepath)
                    break  # Found in this file, move to next file

if not html_files_found:
    print("_site is empty. Rebuild the documentation.")
    exit()

# 3. Output matched files
for filepath in matching_files:
    print(f"Match: {filepath}")

# 4. Output summary count
count = len(matching_files)
if count > 0:
    print(f"Found {count} files with improperly placed HTML entities.")
else:
    print("Found no files with improperly placed HTML entities.")
