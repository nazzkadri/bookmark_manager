require 'bookmark'

describe Bookmark do

  # subject(:bookmark_instance) { described_class.new() }
  # let(:bookmarks) { double(:bookmark) }

  describe '.all' do
    it 'returns all bookmarks' do
      insert_values_for_testing
      bookmarks = Bookmark.all
      bookmark = Bookmark.all.first
      expect(bookmarks.length).to eq 3
      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq 'Makers Academy'
      expect(bookmark.url).to eq 'http://www.makersacademy.com'

      # expect(bookmarks).to include('http://www.makersacademy.com')
      # expect(bookmarks).to include('http://www.destroyallsoftware.com')
      # expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it 'adds a new bookmark to the table of bookmarks' do
      bookmark = Bookmark.create('Test Bookmark', 'http://www.testbookmark.com')

      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq 'Test Bookmark'
    end

    it 'raises an error when the url is incorrect' do
      # expect { Bookmark.create('not a real bookmark') }.to raise_error "You must submit a valid URL"
      bookmark = Bookmark.create('fake', 'not a real bookmark')
      expect(bookmark).not_to be_a Bookmark
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create('Test Bookmark', 'http://www.testbookmark.com')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0  
    end
  end

end
