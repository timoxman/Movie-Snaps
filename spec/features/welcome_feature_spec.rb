require 'rails_helper'

feature 'User is accesses the site' do

  before(:each) do
    visit root_path
  end

  scenario 'and sees the welcome page' do
    expect(page).to have_content 'Welcome to Movie Snaps'
  end

  scenario 'sees a message if no photos have been uploaded' do
    expect(Photo.count).to eq 0
    expect(page).not_to have_content 'No photos have been uploaded!'
  end

  scenario 'and sees recently uploaded photo list and carousel' , js: true do
    create_visit
    photo = Photo.first
    expect(page).not_to have_content 'No photos have been uploaded!'
    expect(page).to have_content photo.caption
    expect(page).to have_css('img', :count => 2)
  end

  scenario 'and wants to begin uploading photos' do
    click_link 'here'
    expect(current_path).to eq locations_path
  end

end