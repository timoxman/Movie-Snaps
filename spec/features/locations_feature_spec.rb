require 'rails_helper'

feature 'A user wants to add the location for a film' do

  before do
    set_omniauth
    visit '/'
    click_link 'Sign in with Facebook'
    click_link 'here'
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
    click_button 'Confirm Location'
    expect(page).to have_content 'Click on the map to add a marker'
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