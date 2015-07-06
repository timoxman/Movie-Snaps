require 'rails_helper'

feature 'Photos' do
# log in -----
# Click here to upload Photos ---
# Click on location already on page
# Click on movie
# Fill out form to add visit
# Submit and be redirected to IMAGE PAGE AHHHHHHHHHH!!!!
# form filling in!
# Submit
# test that caption and movie name is on page
# check date uploaded - by checking same in database as on page?

  before(:each) do
    create_visit
    click_link 'here'
    click_link "Louvre Pyramid, 75001, Paris, France"
    click_link "The Da Vinci Code"
    fill_in 'visit_description', with: 'Ate a croissant'
    click_button 'Create Visit'
  end

  scenario 'User can add a photo through the  site', js: true do
    fill_in 'caption', with: 'Me, my croissant and Le Louvre'
    attach_file 'photo_image', './public/images/bond.jpg'
    expect { click_button 'Create Photo' }.to change { Photo.count }.by 1
    expect(current_path).to eq root_path
    expect(page).to have_css 'img'
  end

  scenario '' do
  end
end