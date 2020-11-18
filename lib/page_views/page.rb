class Page
  attr_accessor :name, :viewer_ips

  def initialize(name, viewer_ips = [])
    @name = name
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
