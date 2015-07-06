require 'rails_helper'

feature 'User views another user\'s profile page' do

  before(:each) do
    create_visit
    user = User.last
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

  scenario "displays user photo" do
    expect(page).to have_selector("img[src*='http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Da%20Vinci%20Code%20-%20The%20Pyramid%20Louvre%20-%20Fan%20Photo_zpsgixesmtr.jpg']")
  end

  scenario "displays correct number of visits" do
    expect(page.all('ul.visits li.visit').size).to eq(1)
  end

  scenario "displays correct number of photos" do
    expect(page.all('ul.photos li.photo').size).to eq(1)
  end

  xscenario "displays correct number of photos" do
    expect(page.all('ul.comments li.comment').size).to eq(1)
  end

end