require 'bookmark'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it 'adds a new bookmark to the table of bookmarks' do
      Bookmark.create('www.facebook.com')
      expect(Bookmark.all).to include('www.facebook.com')
    end
  end

  # describe '.create' do
  #   it 'does not create a new bookmark if the URL is not valid' do
  #     Bookmark.create('not a real bookmark')
  #     expect(Bookmark.all).not_to include 'not a real bookmark'
  #   end
  # end

end
