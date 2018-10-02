
feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    insert_values_for_testing
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
