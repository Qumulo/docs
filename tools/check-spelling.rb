#!/usr/bin/env ruby
# encoding: UTF-8

require 'ffi/hunspell'
require 'cgi'
require 'htmlentities'

DECODER = HTMLEntities.new

def preprocess_content(content, filename, allowlist_words)
  content = content.gsub(/&shy;/i, '') # Remove soft hyphens
  content = DECODER.decode(content)    # Decode remaining entities

  # Filter YAML Frontmatter strictly at the start of the file (\A)
  fields = if filename.start_with?('qq-cli-command-guide/')
             '(help|summary|synopsis)'
           elsif filename.start_with?('rest-api-guide/')
             '(description|summary)'
           else
             '(title|summary)'
           end

  content = content.sub(/\A---[\s\S]*?---\n?/m) do |match|
    kept_fields = match.scan(/#{fields}:.*?\n(?! )/m).join
    "---\n#{kept_fields}---\n"
  end

  # Strip code blocks and inline code first (preserving line counts)
  content = content
    .gsub(/```[\s\S]*?```/m) { |m| "\n" * m.count("\n") }              # ``` code blocks ```
    .gsub(/`[^`]*`/, ' ')                                              # Inline `code`
    .gsub(/<code[^>]*>[\s\S]*?<\/code>/m) { |m| "\n" * m.count("\n") } # <code> tags
    .gsub(/<pre[^>]*>[\s\S]*?<\/pre>/m) { |m| "\n" * m.count("\n") }   # <pre> tags
    .gsub(/<style>.*?<\/style>/m) { |m| "\n" * m.count("\n") }         # <style> tags

  # Extract remaining allowed frontmatter field values to plain text
  content = content.sub(/\A---[\s\S]*?---\n?/m) do |match|
    match.scan(/:\s*([^\n]+)/).flatten.join(' ') + "\n"
  end

  # Clean up Liquid tags, links, and prose markup
  content
    .gsub(/\{\{.+?\}\}/, ' ')
    .gsub(/{%\s*include\s+shared_image\.html.*%}/, ' ')
    .gsub(/{%\s*capture\s+[^\s]+\s*%\}\s*(.*){%\s?endcapture\s?%}/, '\1')
    .gsub(/{%\s?capture[^}]*}(?:\n)?{(?:.*\n)*^}(?:.*\n)?{%\s?endcapture\s?%}/m, ' ')
    .gsub(/content=\S+\s+%}/, ' ')
    .gsub(/\[([^\]]+)\]\([^)]+\)/, '\1')
    .gsub(/{%\s*include\s+content-reuse\/[^\n%]+\.md(?:\s+\w+="[^"]*")*\s*%}/, ' ')
    .gsub(/([[:alnum:]]+(_|-))+[[:alnum:]]+/, ' ')
    .gsub(/\b[A-Za-z]*-?[A-Za-z]+(?:ing|ING)\b(?!_SPACE_)/, '_SPACE_')
    .gsub(/[A-Z]\d+\b/, ' ')
    .gsub(/\b\d+T\b/, ' ')
    .gsub(/\b\d+TB\b/, ' ')
    .gsub(/\b\d+U\b/, ' ')
    .gsub(/\b\d+UH\b/, ' ')
    .gsub(/\beth\d+\b/, ' ')
    .gsub(/\bSev\d+\b/, ' ')
    .gsub(/SMBv\d+(\.\d+)?/, ' ')
    .gsub(/(v\d+)\b/, ' ')
    .gsub(/\b\d+[ap]m\b/, ' ')
    .gsub(/(SHA\d+)\b/, ' ')
    .gsub(/(Gen\d+)\b/, ' ')
    .gsub(/C-\d+[A-Za-z]*\b/, ' ')
    .gsub(/K-\d+[A-Za-z]*\b/, ' ')
    .gsub(/ConnectX-\d+\b/, ' ')
    .gsub(/{%\s*if page\.[^%]+%}\s*([\s\S]*?)(?:{%\s*(?:elsif[^%]+|else)\s*%}\s*([\s\S]*?))?{%\s*endif\s*%}/m, ' ')
    .gsub(/{%\s*unless[^%]+%}\s*([\s\S]*?){%\s*endunless\s*%}/m, ' ')
    .gsub(/{%\s*include\s+rfc\.html\s+rfc='[^']*'\s*%}/, ' ')
    .gsub(/{%\s*include\s+qq\.html\s+command="[^']*"\s*%}/, ' ')
    .gsub(/{%\s*assign\s+\w+\s*=.*?%}/m, ' ')
    .gsub(/{%\s*comment\s*%}.*?{%\s*endcomment\s*%}/m, ' ')
    .gsub(/{%\s*include image\.html .*?%}/m, ' ')
    .gsub(/var[[:alpha:]]*/, ' ')
    .gsub(/\{%\s*endcapture\s*%\}/, ' ')
    .gsub(/\{%\s*endif\s*%\}/, ' ')
    .gsub(/\{%\s*endunless\s*%\}/, ' ')
    .gsub(/="[^"]+\.(?:png|jpg|jpeg|webp)"/, '')
    .gsub(/&apos;/, "'")
    .gsub(/&vellip;/i, "⋮")
    .gsub(/<\/?[^>]+>/, ' ')
    .gsub(/\{%\s*capture\s+[^\s]+\s*%\}/, ' ')
    .gsub(/content=\S+\s+%}/, ' ')
    .gsub(/\b[\p{L}\p{N}_]+\s*=/u, '')
    .gsub(/\b(#{allowlist_words.join('|')}|[A-Za-z]+-\d+-[A-Za-z]+)\b/, '_SPACE_')
    .gsub(/_SPACE_/, '')
end

# Initialize misspelling counter
misspelling_count = 0

# Load allowlists and ignorelists
allowlist_words = File.exist?('tools/.spelling-allowlist') ? File.readlines('tools/.spelling-allowlist', chomp: true) : []
ignore_files = File.exist?('tools/.spelling-ignorefiles') ? File.readlines('tools/.spelling-ignorefiles', chomp: true) : []

incorrect_words = []

FFI::Hunspell.dict('en_US') do |dict|
  Dir.glob("**/*.md").each do |filename|
    next if ignore_files.any? { |ignore_file| File.fnmatch?(ignore_file, filename) }

    file_content = File.read(filename)
    processed_content = preprocess_content(file_content, filename, allowlist_words)

    processed_content.each_line.with_index do |line, line_num|
      allowlist_words.each do |phrase|
        line.gsub!(/\b#{Regexp.escape(phrase)}\b/, '') if line.include?(phrase)
      end

      words = line.scan(/[\p{L}0-9_\-']+/u)

      words.each do |word|
        normalized_word = word.gsub(/^[[:punct:]]+|[[:punct:]]+$/, '')
        next if normalized_word.empty? || dict.check?(normalized_word) || allowlist_words.include?(normalized_word) || normalized_word == 'NFSv4.1'
        incorrect_words << { word: word, filename: filename, line_number: line_num + 1 }
        misspelling_count += 1
      end
    end
  end
end

puts "\n"
incorrect_words.each do |entry|
  puts "\e[31m#{entry[:word]}\e[0m in \e[33m#{entry[:filename]}\e[0m on line \e[35m#{entry[:line_number]}\e[0m"
end
puts "\nPotential misspellings: #{misspelling_count}\n\n"

exit 1 if misspelling_count > 0
