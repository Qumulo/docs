require "jekyll"

module Jekyll
  module LastModifiedAt
    def last_modified_at(path)
      full_path = File.join(Jekyll.sanitized_path(@context.registers[:site].source, path))

      return nil unless File.exist?(full_path)

      # Run git log to get last modified time
      git_time = `git log -1 --format="%ct" -- "#{full_path}" 2>/dev/null`.strip
      return nil if git_time.empty?

      Time.at(git_time.to_i).utc
    rescue
      nil
    end
  end
end

Liquid::Template.register_filter(Jekyll::LastModifiedAt)
