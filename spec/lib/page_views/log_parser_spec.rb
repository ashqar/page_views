require_relative '../../../lib/page_views'

RSpec.describe LogParser, 'methods' do
  let(:log_file_content) do
    <<~CONTENT
      /home 1.1.1.1
      /home 1.1.1.2
      /home 1.1.1.1
      /about 1.1.1.2
      /about 1.1.1.4
      /about 1.1.1.6
    CONTENT
  end

  subject { described_class.new('path_to_file') }

  before do
    allow(File).to receive(:open).and_return(StringIO.new(log_file_content))
  end

  describe '.lines' do
    it 'parses a weblog and returns a hash' do
      expect(subject.lines).to be_kind_of(Hash)
    end

    it 'returns hash with keys as page_path and value as an array of viewer_ips' do
      expect(subject.lines[:"/home"]).to eq(['1.1.1.1', '1.1.1.2', '1.1.1.1'])
    end
  end
end
