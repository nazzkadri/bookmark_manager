require 'pg'

def setup_test_database
  conn = PG.connect dbname: 'bookmark_manager_test'
  conn.exec ('TRUNCATE bookmarks')
end

def insert_values_for_testing
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
end
