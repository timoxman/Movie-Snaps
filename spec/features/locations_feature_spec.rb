require 'rails_helper'

feature 'A user wants to add the location for a film' do

  before(:each) do
    visit '/'
    create_logged_in_user
    click_link 'here'
  end

  scenario 'they have the option to enter a location address first' do
    expect(page).to have_button 'Place Marker'
  end

  scenario 'they enter address and the film to save it to the database', js: true do
    fill_in 'enterDestination', with: 'Makers Academy, London'
    click_button 'Visit'
    sleep 1
    click_button 'Place Marker'
    fill_in 'enterMovie', with: 'Shrek'
    expect { click_button 'Confirm Location' }.to change { Location.count }.by 1
  end

  scenario 'user must click on the map to create a marker', js: true do
    visit '/locations'
    expect(page).not_to have_button 'Confirm Location'
  end

  context 'no locations have been added' do
    scenario 'should display a prompt to add a location (L01)' do
      visit '/locations'
      expect(page).to have_content 'No locations yet'
      expect(page).to have_button 'Place Marker'
    end
  end

  context 'locations have been added' do
    before do
      Location.create(address: 'Lewisham Fire Station')
    end

    scenario 'display locations (L02)' do
      visit '/locations'
      expect(page).to have_content('Lewisham Fire Station')
      expect(page).not_to have_content('No locations yet')
    end
  end


  context 'viewing locations' do

    let!(:lfs){Location.create(address:'Lewisham Fire Station')}

    scenario 'lets a user view movies associated with a location (L04)' do
     visit '/locations'
     click_link 'Lewisham Fire Station'
     expect(page).to have_content 'Was it one of these films?'
     expect(current_path).to eq "/locations/#{lfs.id}/scenes"
    end

  end

end