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
  .gsub(/([[:alnum:]]+(_|-))+[[:alnum:]]+/, ' ')
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

#      words = line.scan(/(?:F\d+|K-\d+[A-Z]|C-\d+[A-Z]|[\w'-]+)/)

words = line.scan(/[a-zA-Z0-9_\-']+/)

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

