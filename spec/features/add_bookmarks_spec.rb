
feature 'add new bookmarks' do
  scenario 'add "www.facebook.com" as new bookmark' do
    visit('/bookmarks')
    #fill_in('url', with: 'not a real bookmark')
    fill_in('url', with: "http://www.facebook.com")
    click_button('Add Bookmark')
    #expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "http://www.facebook.com"
  end

    scenario 'add invalid url' do
      visit('/bookmarks')
      fill_in('url', with: 'not a real bookmark')
      click_button('Add Bookmark')
      expect(page).not_to have_content "not a real bookmark"
      #expect(page).to have_content "You must submit a valid URL"
    end

end
