require 'rails_helper'

feature 'Photos' do

  before(:each) do
    create_visit
    click_link 'here'
    fill_in 'enterDBLocation', with: 'Louvre Pyramid, 75001, Paris, France'
    click_button 'Select Location'
    click_link "The Da Vinci Code"
  end

  scenario 'User can add a photo through the site', js: true do
    fill_in 'visit_visit_description', with: 'Ate a croissant'
    fill_in 'visit_photo_caption', with: 'Me, my croissant and Le Louvre'
    attach_file 'visit_photo_image', './public/images/bond.jpg'
    expect { click_button 'Submit' }.to change { Photo.count }.by 1
    expect(current_path).to eq root_path
    expect(page).to have_css 'img'
  end

end