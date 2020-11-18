require_relative '../../../lib/page_views'

RSpec.describe Page, 'methods' do
  subject { described_class.new('/path', ['1.1.1.1', '1.1.1.1', '1.1.2.3']) }

  describe '.views' do
    it 'returns count of page views' do
      expect(subject.views).to eq(3)
    end
  end

  describe '.unique_views' do
    it 'returns count of unique page views' do
      expect(subject.unique_views).to eq(2)
    end
  end

  describe '.add_viewer_ip' do
    it 'adds supplied ip to viewer_ips list' do
      subject.add_viewer_ip('1.2.3.4')
      expect(subject.views).to eq(4)
    end
  end
end
