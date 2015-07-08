require 'rails_helper'

feature 'User clicks on a previously added location' do

  before(:each) do
    create_visit
    visit locations_path
    click_link 'Louvre Pyramid, 75001, Paris, France'
  end

  scenario 'and sees a list of movies associated with it', js: true do
    expect(page).to have_content 'The Da Vinci Code'
  end

  scenario 'has the option to add a new scene to that movie', js: true do
    click_link 'The Da Vinci Code'
    expect(page).to have_content 'Tell us something about your visit'
  end

end