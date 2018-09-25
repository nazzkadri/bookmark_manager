class Bookmark

def self.all
  conn = PG.connect dbname: 'bookmark_manager' , user: 'nazzkadri'
  rs = conn.exec ('SELECT * FROM bookmarks')
  rs.map { |bookmark| bookmark['url']}
end

end
