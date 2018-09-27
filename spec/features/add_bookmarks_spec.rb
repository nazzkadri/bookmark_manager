
feature 'add new bookmarks' do
  scenario 'add "www.facebook.com" as new bookmark' do
    visit('/bookmarks')
    #fill_in('url', with: 'not a real bookmark')
    fill_in('url', with: "www.facebook.com")
    click_button('Add Bookmark')
    #expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "www.facebook.com"
  end
end
