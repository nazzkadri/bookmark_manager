
feature 'Testing framework' do
  scenario 'should display Hello World' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    bookmarks = Bookmark.all
    expect(bookmarks).to have_content "http://www.makersacademy.com"
    expect(bookmarks).to have_content "http://www.destroyallsoftware.com"
    expect(bookmarks).to have_content "http://www.google.com"
  end
end
