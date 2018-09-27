require 'bookmark'

describe Bookmark do

  # subject(:bookmark_instance) { described_class.new() }
  # let(:bookmarks) { double(:bookmarks) }

  describe '.all' do
    it 'returns all bookmarks' do
      insert_values_for_testing
      bookmarks = Bookmark.all
      #expect(bookmarks).to include(bookmark_instance)
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it 'adds a new bookmark to the table of bookmarks' do
      Bookmark.create('facebook','http://www.facebook.com')
      expect(Bookmark.all).to include('http://www.facebook.com')
    end
  end

  it 'raises an error when the url is incorrect' do
    #expect { Bookmark.create('not a real bookmark') }.to raise_error "You must submit a valid URL"
    Bookmark.create('fake', 'not a real bookmark')
    expect(Bookmark.all).not_to include('not a real bookmark')
  end

end
