require_relative 'log_item'

class LogReader
  attr_reader :log_file, :log_items

  def initialize(log_file)
    @log_file = log_file
    @log_items = []
  end

  def parse_log_file
    File.read(log_file).each_line do |line|
      url, ip = line.split
      log_items << LogItem.new(url, ip)
    end
  end

  def pages_by_views
    log_items.group_by { |l| l.url }.
        map { |url, items| [url, items.count]}.
        sort { |a,b| a[1] <=> b[1] }.
        reverse
  end

  def pages_by_unique_visits
    log_items.group_by { |l| l.url }.
        map { |url, items| [url, items.map(&:ip).uniq.count] }.
        sort { |a, b| a[1] <=> b[1] }.
        reverse
  end

end