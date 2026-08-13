#!/usr/bin/env ruby

require 'yaml'
require 'set'
require 'fileutils'

SIDEBARS_DIR = '_data/sidebars'
EXCLUDE_DIRS = /\A[_.]/

# Standardize URL strings for path comparisons
def normalize(url)
  url.to_s
     .sub(%r{\A/}, '')
     .sub(/\/index\.html\z/, '')
     .sub(/\.html\z/, '')
     .sub(/\/\z/, '')
end

# Recursively traverse nested sidebar and extract link URLs
def collect_urls(obj)
  return [] unless obj.is_a?(Hash) || obj.is_a?(Array)
  
  urls = []
  if obj.is_a?(Hash)
    urls << obj['url'] if obj['url']
    obj.each_value { |v| urls += collect_urls(v) }
  elsif obj.is_a?(Array)
    obj.each { |item| urls += collect_urls(item) }
  end
  urls
end

# Load sidebar YAML file and cache its set of normalized URLs
def load_sidebar(name, cache)
  return cache[name] if cache.key?(name)
  
  path = "#{SIDEBARS_DIR}/#{name}.yml"
  return cache[name] = nil unless File.exist?(path)
  
  urls = collect_urls(YAML.load_file(path))
  cache[name] = urls.map { |u| normalize(u) }.to_set
end

# Helper for safe interactive prompts with EOF or non-interactive shells
def prompt_yes?(message)
  print message
  $stdout.flush
  input = $stdin.gets
  return false if input.nil?

  input.strip.downcase.start_with?('y')
end

sidebar_cache = {}

# Find all Markdown files, ignoring Jekyll internal or hidden directories
md_files = Dir.glob('**/*.md').reject do |f|
  f.split('/').any? { |part| part.match?(EXCLUDE_DIRS) }
end

not_in_sidebar = []

md_files.each do |f|
  content = File.read(f)
  front_matter = content.match(/\A---\r?\n(.*?)\r?\n---/m)
  next unless front_matter

  begin
    meta = YAML.safe_load(front_matter[1])
  rescue
    next
  end

  # Process only files that explicitly define a sidebar and permalink
  next unless meta.is_a?(Hash) && meta['permalink'] && meta['sidebar']

  permalink    = normalize(meta['permalink'])
  raw_plink    = meta['permalink'].to_s
  sidebar_name = meta['sidebar']&.to_s&.strip

  sidebar_urls = load_sidebar(sidebar_name, sidebar_cache)
  
  if sidebar_urls.nil?
    not_in_sidebar << { file: f, permalink: raw_plink, reason: "sidebar file #{SIDEBARS_DIR}/#{sidebar_name}.yml not found" }
  elsif !sidebar_urls.include?(permalink)
    not_in_sidebar << { file: f, permalink: raw_plink, reason: "permalink '#{raw_plink}' not found in #{SIDEBARS_DIR}/#{sidebar_name}.yml" }
  end
end

# Local Cleanup Prompt Handling
in_ci = ENV['GITHUB_ACTIONS'] == 'true'

if !in_ci && not_in_sidebar.any?
  qq_files = not_in_sidebar.select do |r|
    r[:file].include?('qq-cli-command-guide') || r[:permalink].include?('qq-cli-command-guide')
  end

  rest_files = not_in_sidebar.select do |r|
    r[:file].include?('rest-api-guide') || r[:permalink].include?('rest-api-guide') ||
    r[:file].include?('ret-api-guide')  || r[:permalink].include?('ret-api-guide')
  end

  files_to_delete = []
  deleted_labels  = []

  # qq CLI
  if qq_files.any?
    puts "\nFound #{qq_files.size} outdated qq CLI page(s):"
    qq_files.each { |r| puts "  - #{r[:file]}" }
    if prompt_yes?("Delete outdated qq CLI pages? (y/n) ")
      files_to_delete += qq_files.map { |r| r[:file] }
      deleted_labels << "qq CLI"
    end
  end

  # REST API
  if rest_files.any?
    puts "\nFound #{rest_files.size} outdated REST API page(s):"
    rest_files.each { |r| puts "  - #{r[:file]}" }
    if prompt_yes?("Delete outdated REST API pages? (y/n) ")
      files_to_delete += rest_files.map { |r| r[:file] }
      deleted_labels << "REST API"
    end
  end

  # Perform deletion and ask the user to commit changes
  if files_to_delete.any?
    files_to_delete.uniq!
    puts "\nDeleting #{files_to_delete.size} file(s)..."
    
    files_to_delete.each do |f|
      File.delete(f) if File.exist?(f)
    end

    # Remove deleted files from current error set
    not_in_sidebar.reject! { |r| files_to_delete.include?(r[:file]) }

    # Commit changes
    if prompt_yes?("\nCommit changes? (y/n) ")
      commit_msg = "Cleaning up outdated #{deleted_labels.join(' and ')} pages"
      system("git", "add", "-u")
      system(
        "git",
        "-c", "user.name=Team Qontent",
        "-c", "user.email=qontent@qumulo.com",
        "commit",
        "-m", commit_msg
      )
    end
  end
end

puts "\nFound .md files not associated with a .yml sidebar file:"
if not_in_sidebar.empty?
  puts "  None"
  exit 0
else
  not_in_sidebar.each { |r| puts "  #{r[:file]}\n    #{r[:reason]}" }
  exit 1
end
