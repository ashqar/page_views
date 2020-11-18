require_relative '../../lib/page_views'

RSpec.describe PageViews, 'methods' do
  subject { described_class.new('file') }

  let(:log_file_content) do
    <<~CONTENT
      /home 1.1.1.1
      /home 1.1.1.1
      /home 1.1.1.1
      /home 1.1.1.1
      /about 1.1.1.2
      /about 1.1.1.4
      /about 1.1.1.6
      /about/2 1.1.1.1
      /about/2 1.1.1.2
    CONTENT
  end

  let(:page_paths_ordered_by_views) { %w[/home /about /about/2] }
  let(:page_paths_ordered_by_unique_views) { %w[/about /about/2 /home] }

  before do
    allow(File).to receive(:open).and_return(StringIO.new(log_file_content))
  end

  describe '.pages_ordered_by_views' do
    context 'orders pages by view count in a descending order' do
      it 'returns an ordered array of pages' do
        expect(subject.pages_ordered_by_views.map(&:path))
          .to eq(page_paths_ordered_by_views)
      end
    end
  end

  describe '.pages_ordered_by_unique_views' do
    context 'orders pages by unique view count in a descending order' do
      it 'returns an ordered array of pages' do
        expect(subject.pages_ordered_by_unique_views.map(&:path))
          .to eq(page_paths_ordered_by_unique_views)
      end
    end
  end
end
