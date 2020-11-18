class LogParser
  def initialize(log_file)
    @log_file = log_file
  end

  def lines
    lines = {}
    f = File.open(@log_file)
    f.each_line do |line|
      page_path, viewer_ip = line.chomp.split(' ')
      if lines.key?(page_path.to_sym)
        lines[page_path.to_sym].push(viewer_ip)
      else
        lines[page_path.to_sym] = [viewer_ip]
      end
    end
    lines
  end
end
