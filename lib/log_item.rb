class LogItem
  attr_accessor :url, :ip

  def initialize(url, ip)
    @url, @ip = url, ip
  end

end