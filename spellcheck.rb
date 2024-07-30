require 'ffi/hunspell'

def preprocess_content(content, filename, allowlist_words)
  if filename.start_with?('qq-cli-command-guide/')
    # For files under qq-cli-command-guide/, keep only help, summary, and synopsis fields
    content.gsub!(/---(.*?)---/m) do |match|
      yaml_content = match
      # Keep only help, summary, and synopsis fields
      kept_fields = yaml_content.scan(/(help|summary|synopsis):.*?\n(?! )/m).join
      "---\n#{kept_fields}---"
    end
  end

  content
    .gsub(/(`[^`]*`)\s*(`[^`]*`)?\s*(`[^`]*`)?\s*(`[^`]*`)?/, ' ')           # Ignore all instances of inline `code`
    .gsub(/(```[\s\S]*?```)\s*(```[\s\S]*?```)?\s*(```[\s\S]*?```)?/, ' ')   # Ignore all instances od ```code blocks```
    .gsub(/<pre class="[^"]*">[\s\S]*?<\/pre>/m, ' ')                        # Ignore <pre> tags
    .gsub(/```[\s\S]*?```/, ' ')                                             # Enhanced removal of code blocks with optional language specifiers
    .gsub(/\b\d+T\b/, ' ')                                                   # Ignore <N>T patterns
    .gsub(/\b\d+TB\b/, ' ')                                                  # Ignore <N>TB patterns
    .gsub(/\beth\d+\b/, ' ')                                                 # Ignore eth<N> patterns
    .gsub(/\bSev\d+\b/, ' ')                                                 # Ignore Sev<N> patterns
    .gsub(/SMBv\d+(\.\d+)?/, ' ')                                            # Ignore `SMBv<N>`
    .gsub(/(v\d+)\b/, ' ')                                                   # Ignore `v<N>`
    .gsub(/<code>.*?<\/code>/m, ' ')                                         # Ignore content within <code> tags
    .gsub(/<pre>.*?<\/pre>/m, ' ')                                           # Ignore content within <pre> tags
    .gsub(/\[.*?\]\((.*?)\)/, ' ')                                           # Ignore Markdown links, capturing the URLs in parentheses
    .gsub(/\[([^\]]+)\]\([^)]+\)/, '\1')                                     # Ignore Markdown links, keeping only the text within square brackets
    .gsub(/\b[A-Za-z]*-?[A-Za-z]+(?:ing|ING)\b(?!_SPACE_)/, '_SPACE_')       # Ensure `ing` doesn't get separated from word root
    .gsub(/G&auml;vle/, 'Gävle')                                             # Ignore special cases
    .gsub(/d&aelig;/i, 'dæmons')
    .gsub(/\{%\s*capture\s+[\s\S]*?%\}[\s\S]*?\{%\s*endcapture\s*%\}/m, '')  # Ignore Liquid capture tags comprised entirely of JSON
    .gsub(/="[^"]+\.(?:png|jpg)"/, '')                                       # Ignore image files
    .gsub(/(?:&shy;)/, '')                                                   # Ignore `&shy;`
    .gsub(/(?:permalink|redirect_from|sidebar|include_content|layout|redirect_to|search|platform):\s*.*$/, '') # Exclude specific YAML key value
    .gsub(/---(.*?)---/m) do |match|                                         # Extract values from YAML front matter, keeping them as plain text
      match.scan(/:\s*([^\n]+)/).flatten.join(' ')
    end
    .gsub(/\{% if page\.platform == '[^']+' %\}(.*?)\{% endif %\}/m, '\1')   # Ignore terms of if-else conditions
    .gsub(/<style>.*?<\/style>/m, ' ')                                       # Ignore <style> tags
    .gsub(/{%\s*include\s+qq\.html\s+command=['"][^'"]*['"]\s*%}/, ' ')      # Ignore qq CLI Guide links
    .gsub(/\[[^\]]*\]\([^)]*\([^)]*\)\)/, '[]()')                            # Ignore Markdown URLs
    .gsub(/{%\s*assign\s+\w+\s*=.*?%}/m, ' ')                                # Ignore {% assign %} Liquid tags
    .gsub(/\b\d+[ap]m\b/, ' ')                                               # Ignore `<N>am` and `<N>pm`
    .gsub(/{%\s*include\s+rfc\.html\s+rfc='[^']*'\s*%}/, ' ')                # Ignore RFC links
    .gsub(/&apos;/, "'")                                                     # Replace &apos; with '
    .gsub(/\[[^\]]*\]\([^)]*\([^)]*\)\)/, '[]()')                            # Ignore Markdown URLs
    .gsub(/Sev\d+\b/, ' ')                                                   # Ignore `Sev<N>`
    .gsub(/[A-Z]\d+\b/, ' ')                                                 # Ignore a single capital letter followed by a number
    .gsub(/{%\s*comment\s*%}.*?{%\s*endcomment\s*%}/m, ' ')                  # Ignore comments
    .gsub(/{%\s*include image\.html .*?%}/m, ' ')                            # Ignore images       
    .gsub(/(SHA\d+)\b/, ' ')                                                 # Ignore `SHA<N>`
    .gsub(/(Gen\d+)\b/, ' ')                                                 # Ignore `Gen<N>`
    .gsub(/C-\d+[A-Za-z]*\b/, ' ')                                           # Ignore `C-<N>T`
    .gsub(/K-\d+[A-Za-z]*\b/, ' ')                                           # Ignore `K-<N>T`
    .gsub(/ConnectX-\d+\b/, ' ')                                             # Ignore `ConnectX-<N>`
    .gsub(/\{\{.+?\}\}/, ' ')                                                # Ignore Liquid variables
    .gsub(/{%\s*include\s+[^\s]+(.+?)%}/m) { "{% include #{$1} %}" }         # Preserve include content, ignore filename
    .gsub(/<\/?[^>]+>/, ' ')                                                 # Ignore remaining HTML tags, keeping content intact
    .gsub(/&\w+;/, ' ')                                                      # Convert HTML entities to spaces
    .gsub(/\{%\s*capture\s+[^\s]+\s*%\}/, ' ')                               # Ignore variable capture statements
    .gsub(/content=\S+\s+%}/, ' ')                                           # Ignore usage of captured variables
    .gsub(/\{%\s*endcapture\s*%\}/, ' ')                                     # Ignore {% endcapture %} Liquid tags
    .gsub(/\{%\s*endif\s*%\}/, ' ')                                          # Ignore {% endif %} Liquid tags
    .gsub(/\b\w+\b\s*=/, '')                                                 # Exclude any variable name followed by an equal sign
    .gsub(/\b(#{allowlist_words.join('|')}|[A-Za-z]+-\d+-[A-Za-z]+)\b/, '_SPACE_') # Replace allowed phrases with placeholders
    .gsub(/_SPACE_/, '')                                                     # Remove placeholders
end

# Initialize misspelling counter
misspelling_count = 0

# Load the allowlist of words and phrases
allowlist_words = File.exist?('.spelling-allowlist') ? File.readlines('.spelling-allowlist', chomp: true) : []

# Load the list of files to exclude from spellchecking
ignore_files = File.exist?('.spelling-ignorefiles') ? File.readlines('.spelling-ignorefiles', chomp: true) : []

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

      # Adjust the regex to treat words with hyphens or underscores as single words
      words = line.scan(/\b(?:F\d+|K-\d+[A-Z]|C-\d+[A-Z]|[\w']+(?<!-)\b)/)

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

