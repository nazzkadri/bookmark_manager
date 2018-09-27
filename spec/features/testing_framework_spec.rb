
feature 'Testing framework' do
  scenario 'should display Hello World' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end
