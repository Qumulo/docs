#!/usr/bin/env ruby

require 'ffi/hunspell'
require 'cgi'
require 'htmlentities'

DECODER = HTMLEntities.new

def load_allowlist(filepath)
  return [] unless File.exist?(filepath)

  File.readlines(filepath, chomp: true)
      .map(&:strip)
      .reject { |line| line.empty? || line.start_with?('#') }
end

def preprocess_content(content, filename, allowlist_words)
  content = content.gsub(/&shy;/i, '') # Remove soft hyphens
  content = DECODER.decode(content)    # Decode HTML entities

  # Filter front matter strictly at file start
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

  # Strip code blocks & inline code first while preserving line counts:
  # * Multi-line fenced blocks ``` or ````
  # * Indented code blocks (4+ spaces or tabs)
  # * Single-line double ``code`` and single `code` backtick spans
  content = content
    .gsub(/(`{3,})[\s\S]*?\1/m) { |m| "\n" * m.count("\n") }                                               	# ``` or ```` code blocks
    .gsub(/(?:\n[ \t]*\n)((?:[ \t]{4,}(?![*\-+\d]\s)[^\n]*\n?)+)/) { |m| "\n\n" + ("\n" * m.count("\n")) }	# 4+ space / tab indented code
    .gsub(/``[^`\n]*``/, ' ')                                                         				# `` double-backtick inline code ``
    .gsub(/`[^`\n]*`/, ' ')                                                           				# ` single-backtick inline code ` (single line only)
    .gsub(/<code[^>]*>[\s\S]*?<\/code>/m) { |m| "\n" * m.count("\n") }                				# <code> tags
    .gsub(/<pre[^>]*>[\s\S]*?<\/pre>/m) { |m| "\n" * m.count("\n") }                  				# <pre> tags
    .gsub(/<style>.*?<\/style>/m) { |m| "\n" * m.count("\n") }                        				# <style> tags

  # Extract front matter values
  content = content.sub(/\A---[\s\S]*?---\n?/m) do |match|
    match.scan(/:\s*([^\n]+)/).flatten.join(' ') + "\n"
  end

  # Completely discard Liquid comments and output variables {{ ... }}
  content = content.gsub(/\{%\s*comment\s*%\}.*?\{%\s*endcomment\s*%\}/m) { |m| "\n" * m.count("\n") }
  content = content.gsub(/\{\{[\s\S]*?\}\}/m) { |m| "\n" * m.count("\n") }

  # Strip JSON blocks { ... } inside {% capture %} ... {% endcapture %} while preserving line counts
  content = content.gsub(/\{%\s*capture\b[^%]*\%\}([\s\S]*?)\{%\s*endcapture\s*%\}/i) do |full_capture|
    full_capture.gsub(/\{(?!%)(?>(?:[^{}]|(?:\g<0>))*)\}/m) do |json_match|
      "\n" * json_match.count("\n")
    end
  end

  # Process Liquid tags {% ... %}:
  # * Ignore logic/control tags (if, elsif, unless, assign, case, when, capture)
  # * Ignore technical reference tags completely (qq, rest, rfc, image, shared_image, content-reuse)
  # * Keep only quoted prose strings from include tags
  content = content.gsub(/\{%[\s\S]*?%\}/) do |tag|
    newlines = "\n" * tag.count("\n")

    if tag.match?(/\A\{%\s*(?:if|elsif|else|unless|assign|case|when|capture|endcapture|endif|endunless)\b/i)
      next " #{newlines}"
    end

    if tag.match?(/\b(?:qq|rest|rfc|image|shared_image)\.html\b|content-reuse/i)
      next " #{newlines}"
    end

    quotes = tag.scan(/"([^"]*)"|'([^']*)'/).flatten.compact
    prose = quotes.reject do |q|
      q.strip.match?(/\A[\w\-]+\.(?:html|md|sh|png|jpg|jpeg|webp|svg|json|yaml|yml|css|js|py|rb|gif)\z/i)
    end
    " #{prose.join(' ')} #{newlines}"
  end

  # Filter Kramdown anchors/attributes, headings, links, and bolded formatting exemptions
  ignored_terms = /(?<![a-zA-Z0-9\-])(?:qq|syslog|rsyslog|keyspace|ipmitool|sssd|Qumulo-terraform-aws|qq-CLI-Initiated|systemd|realmd|idmapd|kinit|autofs|chown|gcloud|QumuloPrivateIP)(?![a-zA-Z0-9\-])/i
  content = content
    .gsub(/\{[#:][^}]*\}/, ' ')
    .gsub(/^#+.*$/) { |m| m.gsub(ignored_terms, ' ') }
    .gsub(/\[([^\]]+)\]\([^)]+\)/) { |m| m.gsub(ignored_terms, ' ') }
    .gsub(/\*\*[\s\S]*?\*\*|__[\s\S]*?__/) { |m| m.gsub(ignored_terms, ' ').gsub(/(?<![a-zA-Z0-9])IPs(?![a-zA-Z0-9])/, ' ') }

  # Extract link text, strip explicit URLs, hostnames, and standalone filenames
  content = content
    .gsub(/\[([^\]]+)\]\([^)]+\)/, '\1')
    .gsub(%r{\bhttps?://[^\s\)\]>"'`\\]+}, ' ')
    .gsub(%r{\b(?:[a-zA-Z0-9-]+\.)+(?:com|net|org|io|gov|edu|ai|app|co|info|me|dev|local|internal)\b(?:/[^\s\)\]>"'`\\]*)?}, ' ')
    .gsub(/\b[\w\-]+\.(?:html|md|sh|png|jpg|jpeg|webp|svg|json|yaml|yml|css|js|py|rb|gif)\b/i, ' ')

  # Apply allowlist matching safely (preserving hyphenated structures)
  unless allowlist_words.empty?
    escaped_allowlist = allowlist_words.sort_by(&:length).reverse.map { |w| Regexp.escape(w) }
    content = content.gsub(/(?<![\w\-])(#{escaped_allowlist.join('|')})(?![\w\-])/i, ' ')
  end

  # Strip technical identifiers, hardware names, units, variable assignments, and Markdown emphasis underscores
  content
    .gsub(/(?<![\w\-])[\w\-]+\s*=/u, ' ')                                                       									# full_variable_name= or header-name=
    .gsub(/\b[[:alnum:]]+_[[:alnum:]_]+\b/, ' ')                                                 									# snake_case identifiers
    .gsub(/(?<![a-zA-Z0-9])_+|_+(?![a-zA-Z0-9])/, ' ')                                           									# Markdown emphasis (_SPI_ -> SPI)
    .gsub(/(?<![\w\-])\d+(?:T|TB|U|UH|am|pm)(?![\w\-])/i, ' ')                                   									# Unit specs such as 100TB, 2U, 9am
    .gsub(/(?<![\w\-])(?:Dev|DevOps|DevTest|eth\d+|Sev\d+|SMBv\d+(?:\.\d+)?|v\d+|SHA\d+|Gen\d+|C-\d+[A-Za-z]*|K-\d+[A-Za-z]*|ConnectX(?:-\d+)?)(?![\w\-])/i, ' ')	# Hardware & specs
    .gsub(/&apos;/, "'")
    .gsub(/&vellip;/i, "⋮")
    .gsub(/<\/?[^>]+>/, ' ')
end

misspelling_count = 0

allowlist_words = load_allowlist('tools/.spelling-allowlist')
allowlist_set   = allowlist_words.map(&:downcase)
ignore_files    = File.exist?('tools/.spelling-ignorefiles') ? File.readlines('tools/.spelling-ignorefiles', chomp: true) : []

incorrect_words = []

target_files = Dir.glob("**/*.md").reject do |filename|
  ignore_files.any? { |ignore_file| File.fnmatch?(ignore_file, filename) }
end
total_files = target_files.size

FFI::Hunspell.dict('en_US') do |dict|
  target_files.each_with_index do |filename, index|
    # Render a progress bar
    if total_files > 0 && $stdout.tty?
      percent = ((index + 1).to_f / total_files * 100).round
      filled = percent / 2
      bar = '=' * filled + ' ' * (50 - filled)
      print "\r[\e[32m#{bar}\e[0m] #{index + 1}/#{total_files} (#{percent}%)"
      $stdout.flush
    end

    file_content = File.read(filename, encoding: 'UTF-8:UTF-8').scrub
    processed_content = preprocess_content(file_content, filename, allowlist_words)

    processed_content.each_line.with_index do |line, line_num|
      words = line.scan(/[\p{L}0-9_\-']+/u)

      words.each do |word|
        normalized_word = word.gsub(/^[[:punct:]_]+|[[:punct:]_]+$/, '')
        next if normalized_word.empty?
        next if allowlist_set.include?(normalized_word.downcase)
        next if normalized_word =~ /\d/                # Skip words containing numbers (x-amz-content-sha256, FOO-BAR-123, ABC123, NFSv4.1)
        next if dict.check?(normalized_word)

        # Check if all hyphen-separated segments are individually valid words, allowlisted, or 1-char prefixes (such as x-)
        if normalized_word.include?('-')
          parts_valid = normalized_word.split('-').all? do |w|
            w.empty? || w.length == 1 || dict.check?(w) || allowlist_set.include?(w.downcase)
          end
          next if parts_valid
        end

        incorrect_words << { word: word, filename: filename, line_number: line_num + 1 }
        misspelling_count += 1
      end
    end
  end
end

# Clear progress bar line after completion
print "\r\e[K" if total_files > 0 && $stdout.tty?

puts "\n"
incorrect_words.each do |entry|
  puts "\e[31m#{entry[:word]}\e[0m in \e[33m#{entry[:filename]}\e[0m on line \e[35m#{entry[:line_number]}\e[0m"
end
puts "\nPotential misspellings: #{misspelling_count}\n\n"

exit 1 if misspelling_count > 0
