require 'rails_helper'

feature 'User views another user\'s profile page' do

  before(:each) do
    create_visit
    user = User.last
    photo = Photo.last
    Comment.create(remark: 'Nice photo!', photo_id: photo.id, user_id: user.id)
    visit "/users/#{user.id}"
  end

  scenario 'displays user name', js: true do
    expect(page).to have_content('John Doe')
  end

  scenario 'displays user image' do
    expect(page).to have_css 'img#user_img'
  end

  scenario 'displays visit location name' do
    expect(page).to have_content('Louvre Pyramid, 75001, Paris, France')
  end

  scenario 'displays visit movie name' do
    expect(page).to have_content('The Da Vinci Code (2006)')
  end

  scenario 'displays visit description' do
    expect(page).to have_content('This was filmed here')
  end

  scenario 'displays photo caption' do
    expect(page).to have_content('Outside Le Louvre!')
  end

  scenario "displays scene photo" do
    expect(page).to have_selector("img[src*='http://bit.ly/1JBfXCZ']")
  end

  scenario "displays user photo", js: true do
    expect(page).to have_xpath("//img[@alt='Da%252520vinci%252520code%252520%20%252520the%252520pyramid%252520louvre%252520%20%252520fan%252520photo%20zpsgixesmtr']")
  end

  scenario "displays correct number of visits" do
    expect(page.all('ul.visits li.visit').size).to eq(1)
  end

  scenario "displays correct number of photos" do
    expect(page.all('ul.photos li.photo').size).to eq(1)
  end

  scenario "displays correct number of comments", js: true do
    expect(page.all('ul.comments li.comment').size).to eq(1)
  end

end

feature 'User views the user index page' do

  before do
    create_visit
    visit '/users'
  end

  scenario 'enters a user in database and have it autocompleted', js: true do
    fill_autocomplete('enterUser', with: 'John Doe')
    expect(page).to have_selector('ul.ui-autocomplete li.ui-menu-item')
  end

  scenario 'enters a user not in database and not have it autocompleted', js: true do
    fill_autocomplete('enterUser', with: 'Roger Sprocket')
    expect(page).not_to have_selector('ul.ui-autocomplete li.ui-menu-item')
  end

  scenario 'enters a user not in database and sees error message', js: true do
    fill_autocomplete('enterUser', with: 'Roger Sprocket')
    click_button 'Select User'
    expect(page).to have_content('User not in database')
  end

end