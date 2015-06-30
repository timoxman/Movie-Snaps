require 'rails_helper'

feature 'A user wants to add the location for a film' do

  scenario 'and have it saved to the database' do
    visit '/'
    find('#mapDestination').click
    expect { click_button 'Confirm Marker' }.to change { Location.count }.by 1
  end

end