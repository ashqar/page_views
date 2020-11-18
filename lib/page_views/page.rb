class Page
  attr_accessor :path, :viewer_ips

  def initialize(path, viewer_ips = [])
    @path = path
    @viewer_ips = viewer_ips
  end

  def views
    viewer_ips.count
  end

  def unique_views
    viewer_ips.uniq.count
  end

  def add_viewer_ip(ip)
    viewer_ips.push ip
  end
end
