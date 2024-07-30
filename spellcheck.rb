require 'ffi/hunspell'
require 'logger'

# Initialize logger
logger = Logger.new(STDOUT)

def preprocess_content(content, filename, logger)
  # Ignore YAML front matter at the start of the file
  if content.start_with?('---')
    content = content.sub(/\A---(.*?)---/m, '')
  end

  if filename.start_with?('qq-cli-command-guide/')
    content.gsub!(/---(.*?)---/m) do |match|
      yaml_content = match
      kept_fields = yaml_content.scan(/(help|summary|synopsis):.*?\n(?! )/m).join
      "---\n#{kept_fields}---"
    end
  end

  # Remove content within <code>, <pre>, and Liquid tags
  content.gsub!(/<code>[\s\S]*?<\/code>/m, ' ')
  content.gsub!(/<pre>[\s\S]*?<\/pre>/m, ' ')
  content.gsub!(/\{\{.*?\}\}/, ' ')

  content
    .gsub(/\[.*?\]\((.*?)\)/, ' ')                  # Ignore Markdown links
    .gsub(/```[\s\S]*?```/, ' ')                    # Ignore code blocks
    .gsub(/`[^`]*`/, ' ')                           # Ignore inline code in backticks
    .gsub(/<style>.*?<\/style>/m, ' ')              # Ignore <style> tags
    .gsub(/<!--.*?-->/m, ' ')                       # Ignore HTML comments
    .gsub(/{%\s*.*?\s*%}/, ' ')                     # Ignore Liquid tags
    .gsub(/&\w+;/, ' ')                             # Ignore HTML entities
    .gsub(/<\/?[^>]+>/, ' ')                        # Ignore remaining HTML tags
    .gsub(/\bCX\d+\b/, ' ')                         # Ignore CX<N> patterns
    .gsub(/\bv\d+\b/, ' ')                          # Ignore v<N> patterns
    .gsub(/\bConnectX-\d+\b/, ' ')                  # Ignore ConnectX-<N> patterns
    .gsub(/\b\d+TB\b/, ' ')                         # Ignore <N>TB patterns
    .gsub(/\beth\d+\b/, ' ')                        # Ignore eth<N> patterns
    .gsub(/\bF\d+\b/, ' ')                          # Ignore F<N> patterns
    .gsub(/\bSev\d+\b/, ' ')                        # Ignore Sev<N> patterns
    .gsub(/\bPSU\d+\b/, ' ')                        # Ignore PSU<N> patterns
    .gsub(/\bNIC\d+\b/, ' ')                        # Ignore NIC<N> patterns
    .gsub(/\b\d+T\b/, ' ')                          # Ignore <N>T patterns
    .gsub(/\bGen\d+\b/, ' ')                        # Ignore Gen<N> patterns
    .gsub(/\b[A-Z]\d\b/, ' ')                       # Ignore <L><N> patterns where L is a letter and N is a single digit
end

# Initialize misspelling counter
misspelling_count = 0

# Load the allowlist of words and phrases
allowlist_words = File.exist?('.spelling-allowlist') ? File.readlines('.spelling-allowlist', chomp: true) : []
allowlist_pattern = /\b(#{allowlist_words.join('|')})\b/i

# Load the list of files to exclude from spellchecking
ignore_files = File.exist?('.spelling-ignorefiles') ? File.readlines('.spelling-ignorefiles', chomp: true) : []

# Log loaded ignore files and allowlist words
logger.info("Loaded ignore files: #{ignore_files}")
logger.info("Loaded allowlist words: #{allowlist_words}")

# Array to store incorrect words with their filename and line number
incorrect_words = []

FFI::Hunspell.dict('en_US') do |dict|
  Dir.glob("**/*.md").each do |filename|
    if ignore_files.any? { |ignore_file| File.fnmatch?(ignore_file, filename) }
      logger.info("Ignoring file: #{filename}")
      next
    end

    file_content = File.read(filename)
    processed_content = preprocess_content(file_content, filename, logger)

    processed_content.each_line.with_index do |line, line_num|
      # Remove allowlist words
      allowlist_words.each do |allowed_word|
        line.gsub!(/\b#{Regexp.escape(allowed_word)}\b/i, ' ')
      end

      words = line.scan(/\b(?:F\d+|K-\d+[A-Z]|C-\d+[A-Z]|[\w']+(?<!-)\b)/)

      words.each do |word|
        normalized_word = word.gsub(/^[[:punct:]]+|[[:punct:]]+$/, '')
        next if dict.check?(normalized_word) || allowlist_words.include?(normalized_word) || normalized_word == 'NFSv4.1'
        incorrect_words << { word: word, filename: filename, line_number: line_num + 1 }
        misspelling_count += 1
      end
    end
  end
end

# Print incorrect words with formatting
puts "\n"
incorrect_words.each do |entry|
  puts "\e[31m#{entry[:word]}\e[0m in \e[33m#{entry[:filename]}\e[0m on line \e[35m#{entry[:line_number]}\e[0m"
end
puts "\nPotential misspellings: #{misspelling_count}\n"

