require 'rails_helper'

feature 'User visits the site' do

  before(:each) do
    visit root_path
  end

  scenario 'and sees the welcome page' do
    expect(page).to have_content 'Adventure is out there!'
  end

  scenario 'sees a message if no photos have been uploaded' do
    expect(Photo.count).to eq 0
    expect(page).not_to have_content 'No photos have been uploaded!'
  end

  scenario 'and sees all uploaded photos' , js: true do
      create_visit
      photo = Photo.first
      expect(page).not_to have_content 'No photos have been uploaded!'
      expect(page).to have_content photo.caption
  end

  scenario 'and wants to begin uploading photos' do
    click_link 'here'
    expect(current_path).to eq new_scene_path
  end

end

