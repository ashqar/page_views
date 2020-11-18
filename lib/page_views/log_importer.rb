class LogImporter
  def initialize(parser)
    @parser = parser
  end

  #TODO send type to initialiser and use it below instead of constant type Page
  def import
    objects = []
    lines.each do |line|
      objects.push Page.new(line.first.to_s, line.last)
    end
    objects
  end

  private

  def lines
    @parser.lines
  end
end
