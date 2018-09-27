# feature 'validating url' do
#   scenario 'add invalid url' do
#     visit('/bookmarks')
#     fill_in('url', with: 'not a real bookmark')
#     click_button('Add Bookmark')
#     expect(page).not_to have_content "not a real bookmark"
#     expect(page).to have_content "You must submit a valid URL."
#   end
# end
