require 'rails_helper'

feature 'A user wants to add the location for a film' do

  scenario 'and have it saved to the database' do
    visit '/'
    find('#mapDestination').click
    expect { click_button 'Confirm Marker' }.to change { Location.count }.by 1
  end

  scenario 'user must click on the map to create a marker' do
    visit '/'
    click_button 'Confirm Marker'
    expect(page).to have_content 'Click on the map to add a marker'
  end

end