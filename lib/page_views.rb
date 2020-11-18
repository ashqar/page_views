require_relative 'page_views/page'
require_relative 'page_views/log_parser'
require_relative 'page_views/log_importer'

class PageViews
  attr_accessor :pages

  def initialize(file)
    import_log_file(file)
  end

  #TODO Create Pages class to include following page ordering methods
  def pages_ordered_by_views
    @pages.sort do |a, b|
      b.views <=> a.views
    end
  end

  def pages_ordered_by_unique_views
    @pages.sort_by(&:unique_views).reverse!
  end

  private

  def import_log_file(file)
    parser = LogParser.new(file)
    importer = LogImporter.new(parser)
    @pages = importer.import
  end
end
