require 'pg'
require 'uri'

class Bookmark
attr_reader :id, :title, :url, :connection
attr_accessor :bookmarks

  def initialize(id:, title:, url:)
    @id  = id
    @title = title
    @url = url
  end

  def self.all
    set_test_database()
    rs = @connection.exec('SELECT * FROM bookmarks')
    rs.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(title, address)
    return false unless is_url?(address)
    set_test_database()
    result = @connection.exec ("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{address}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    set_test_database()
    @connection.exec ("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  private

  def self.set_test_database
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
    return @connection
  end

  def self.is_url?(address)
    address =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
