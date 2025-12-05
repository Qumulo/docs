# encoding: UTF-8

require 'ffi/hunspell'
require 'cgi'
require 'htmlentities'

DECODER = HTMLEntities.new

def preprocess_content(content, filename, allowlist_words)                               
  content = content.gsub(/&shy;/i, '') # Remove soft hyphens (&shy;) before decoding                                                          
  content = DECODER.decode(content) # Decode remaining entities
  if filename.start_with?('qq-cli-command-guide/')
    content.gsub!(/---(.*?)---/m) do |match|
      yaml_content = match
      kept_fields = yaml_content.scan(/(help|summary|synopsis):.*?\n(?! )/m).join
      "---\n#{kept_fields}---"
    end
  elsif filename.start_with?('rest-api-guide/')
    content.gsub!(/---(.*?)---/m) do |match|
      yaml_content = match
      kept_fields = yaml_content.scan(/(description|summary):.*?\n(?! )/m).join
      "---\n#{kept_fields}---"
    end
  else
    content.gsub!(/---(.*?)---/m) do |match|
      yaml_content = match
      kept_fields = yaml_content.scan(/(title|summary):.*?\n(?! )/m).join
      "---\n#{kept_fields}---"
    end
  end

content
  .gsub(/\{\{.+?\}\}/, ' ')                                                                                        # Ignore Liquid variables
  .gsub(/{%\s*include\s+shared_image\.html.*%}/, ' ')                                                              # Ignore Liquid shared images
  .gsub(/{%\s*capture\s+[^\s]+\s*%\}\s*(.*){%\s?endcapture\s?%}/, '\1')                                            # Ignore capture statements
  .gsub(/{%\s?capture[^}]*}(?:\n)?{(?:.*\n)*^}(?:.*\n)?{%\s?endcapture\s?%}/m, ' ')                                # Ignore capture statements comprised entirely of JSON
  .gsub(/content=\S+\s+%}/, ' ')                                                                                   # Ignore usage of captured variables
  .gsub(/\[([^\]]+)\]\([^)]+\)/, '\1')                                                                             # Ignore Markdown links, keeping only the text within square brackets
  .gsub(/{%\s*include\s+content-reuse\/[^\n%]+\.md(?:\s+\w+="[^"]*")*\s*%}/, ' ')                                  # Ignore transcludes
  .gsub(/([[:alnum:]]+(_|-))+[[:alnum:]]+/, ' ')                                                                   # Ignore underscores and dashes
  .gsub(/\b[A-Za-z]*-?[A-Za-z]+(?:ing|ING)\b(?!_SPACE_)/, '_SPACE_')                                               # Ensure `ing` doesn't get separated from word root
  .gsub(/---(.*?)---/m) do |match|                                                                                 # Extract values from YAML front matter, keeping them as plain text
    match.scan(/:\s*([^\n]+)/).flatten.join(' ')
  end
  .gsub(/```[\s\S]*?```/, ' ')                                                                                     # Ignore all instances of ```code blocks```, with or without syntax highlighting specifiers
  .gsub(/`[^`]*`/, ' ')                                                                                            # Ignore all instances of inline `code`
  .gsub(/<code>.*?<\/code>/m, ' ')                                                                                 # Ignore content in <code> tags
  .gsub(/<pre>.*?<\/pre>/m, ' ')                                                                                   # Ignore content in <pre> tags
  .gsub(/<code class="[^"]*">[\s\S]*?<\/code>/m, ' ')                                                              # Ignore content in <code> tags with attached class
  .gsub(/<pre class="[^"]*">[\s\S]*?<\/pre>/m, ' ')                                                                # Ignore content in <pre> tags with attached class
  .gsub(/<style>.*?<\/style>/m, ' ')                                                                               # Ignore <style> tags
  .gsub(/[A-Z]\d+\b/, ' ')                                                                                         # Ignore a single capital letter followed by a number
  .gsub(/\b\d+T\b/, ' ')                                                                                           # Ignore <N>T patterns
  .gsub(/\b\d+TB\b/, ' ')                                                                                          # Ignore <N>TB patterns
  .gsub(/\b\d+U\b/, ' ')                                                                                           # Ignore <N>U patterns
  .gsub(/\b\d+UH\b/, ' ')                                                                                          # Ignore <N>T patterns
  .gsub(/\beth\d+\b/, ' ')                                                                                         # Ignore eth<N> patterns
  .gsub(/\bSev\d+\b/, ' ')                                                                                         # Ignore Sev<N> patterns
  .gsub(/SMBv\d+(\.\d+)?/, ' ')                                                                                    # Ignore `SMBv<N>` patterns
  .gsub(/(v\d+)\b/, ' ')                                                                                           # Ignore `v<N>` patterns
  .gsub(/\b\d+[ap]m\b/, ' ')                                                                                       # Ignore `<N>am` and `<N>pm` patterns
  .gsub(/(SHA\d+)\b/, ' ')                                                                                         # Ignore `SHA<N>` patterns
  .gsub(/(Gen\d+)\b/, ' ')                                                                                         # Ignore `Gen<N>` patterns
  .gsub(/C-\d+[A-Za-z]*\b/, ' ')                                                                                   # Ignore `C-<N>T` patternws
  .gsub(/K-\d+[A-Za-z]*\b/, ' ')                                                                                   # Ignore `K-<N>T` patterns
  .gsub(/ConnectX-\d+\b/, ' ')                                                                                     # Ignore `ConnectX-<N>` patterns
  .gsub(/{%\s*if page\.[^%]+%}\s*([\s\S]*?)(?:{%\s*(?:elsif[^%]+|else)\s*%}\s*([\s\S]*?))?{%\s*endif\s*%}/m, ' ')
  .gsub(/{%\s*unless[^%]+%}\s*([\s\S]*?){%\s*endunless\s*%}/m, ' ')                                                # Ignore Liquid unless conditionals
  .gsub(/{%\s*include\s+rfc\.html\s+rfc='[^']*'\s*%}/, ' ')                                                        # Ignore Liquid RFC links
  .gsub(/{%\s*include\s+qq\.html\s+command="[^']*"\s*%}/, ' ')                                                     # Ignore Liquid qq CLI links
  .gsub(/{%\s*assign\s+\w+\s*=.*?%}/m, ' ')                                                                        # Ignore Liquid {% assign %} tags
  .gsub(/{%\s*comment\s*%}.*?{%\s*endcomment\s*%}/m, ' ')                                                          # Ignore Liquid comments
  .gsub(/{%\s*include image\.html .*?%}/m, ' ')                                                                    # Ignore Liquid images
  .gsub(/var[[:alpha:]]*/, ' ')                                                                                    # Ignore local variables in YAML
  .gsub(/\{%\s*endcapture\s*%\}/, ' ')                                                                             # Ignore {% endcapture %} Liquid tags
  .gsub(/\{%\s*endif\s*%\}/, ' ')                                                                                  # Ignore {% endif %} Liquid tags
  .gsub(/\{%\s*endunless\s*%\}/, ' ')                                                                              # Ignore {% endunless %} Liquid tags
  .gsub(/="[^"]+\.(?:png|jpg|jpeg|webp)"/, '') 	                                                                   # Ignore image files
  .gsub(/&apos;/, "'")                                                                                             # Replace &apos; with '
  .gsub(/&vellip;/i, "⋮")                                                                                          # Replace &vellip; with ⋮
  .gsub(/<\/?[^>]+>/, ' ')                                                                                         # Ignore remaining HTML tags, keeping content intact
  .gsub(/\{%\s*capture\s+[^\s]+\s*%\}/, ' ')                                                                       # Ignore variable capture statements
  .gsub(/content=\S+\s+%}/, ' ')                                                                                   # Ignore usage of captured variables
  .gsub(/\b[\p{L}\p{N}_]+\s*=/u, '')                                                                               # Exclude any variable name followed by an equal sign
  .gsub(/\b(#{allowlist_words.join('|')}|[A-Za-z]+-\d+-[A-Za-z]+)\b/, '_SPACE_')                                   # Replace allowed phrases with placeholders
  .gsub(/_SPACE_/, '')                                                                                             # Remove placeholders
end

# Initialize misspelling counter
misspelling_count = 0

# Load the allowlist of words and phrases
allowlist_words = File.exist?('tools/.spelling-allowlist') ? File.readlines('tools/.spelling-allowlist', chomp: true) : []

# Load the list of files to exclude from spellchecking
ignore_files = File.exist?('tools/.spelling-ignorefiles') ? File.readlines('tools/.spelling-ignorefiles', chomp: true) : []

# Array to store incorrect words with their filename and line number
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

      words = line.scan(/[\p{L}0-9_\-']+/u) # Unicode-aware

      words.each do |word|
        normalized_word = word.gsub(/^[[:punct:]]+|[[:punct:]]+$/, '')
        next if dict.check?(normalized_word) || allowlist_words.include?(normalized_word) || normalized_word == 'NFSv4.1'
        incorrect_words << { word: word, filename: filename, line_number: line_num + 1 }
        misspelling_count += 1 # Increment the counter for each potential misspelling found
      end
    end
  end
end

# Print incorrect words with formatting
puts "\n"
incorrect_words.each do |entry|
  puts "\e[31m#{entry[:word]}\e[0m in \e[33m#{entry[:filename]}\e[0m on line \e[35m#{entry[:line_number]}\e[0m"
end
puts "\nPotential misspellings: #{misspelling_count}"
puts "\n"

if misspelling_count > 0
  puts "Errors found. Exiting..."
  exit 1
end
