#!/usr/bin/env python3

import os
import re

# Path to output directory
path_to_html_files = '_site/'

# Match <img /> tag
pattern = re.compile(r'<(source|img|br)(.*?) />')

# Iterate through HTML files
for subdir, dirs, files in os.walk(path_to_html_files):
  for file_name in files:
    if file_name.endswith('.html'):
      file_path = os.path.join(subdir, file_name)
            
      # Read a file
      with open(file_path, 'r') as file:
        file_data = file.read()
            
      # Strip out closing slashes
      #file_data = file_data.replace('<br />', '<br>')
      file_data = pattern.sub(r'<\1\2>', file_data)

      # Write changes back to file
      with open(file_path, 'w') as file:
        file.write(file_data)

print("Finished removing closing slashes from void elements.")
