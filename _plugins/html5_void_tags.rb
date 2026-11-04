Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  # Only process HTML output files
  if doc.output_ext == ".html"
    # Strip /> from HTML5 void elements: img, source, br, hr, input, meta, link
    doc.output = doc.output.gsub(/<(img|source|br|hr|input|meta|link)([^>]*?)\s*\/>/i, '<\1\2>')
  end
end
