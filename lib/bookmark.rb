require 'pg'
require 'uri'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    rs = connection.exec ('SELECT * FROM bookmarks')
    rs.map { |bookmark| bookmark['url']}
  end

  def self.create(address)
    #return false unless is_url?(address)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec ("INSERT INTO bookmarks (url) VALUES ('#{address}');")
  end

  # private
  #
  # def self.is_url?(address)
  #   address =~ /\A#{URI::regexp(['http', 'https'])}\z/
  # end

end
