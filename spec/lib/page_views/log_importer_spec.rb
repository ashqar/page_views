require_relative '../../../lib/page_views'

RSpec.describe LogImporter, 'methods' do
  let(:log_file_content) do
    <<~CONTENT
      /main 1.1.1.1
      /main 1.1.1.1
      /main 1.1.1.1
      /about 1.1.1.2
      /about 1.1.1.4
      /about 1.1.1.6
    CONTENT
  end

  let(:parser) { LogParser.new("path_to_file") }

  subject { described_class.new(parser) }

  before do
    allow(File).to receive(:open).and_return(StringIO.new(log_file_content))
    @pages = subject.import
  end

  describe '.import' do
    it 'returns an array of import_type objects' do
      expect(@pages).to be_kind_of(Array)
    end
    it 'returns an array of imported pages from file' do
      expect(@pages[0]).to be_kind_of(Page)
    end

    it 'returns an array of imported pages from file' do
      expect(@pages[0].path).to eq("/main")
    end
  end
end
