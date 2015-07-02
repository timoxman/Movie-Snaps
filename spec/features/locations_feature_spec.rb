require 'rails_helper'

feature 'A user wants to add the location for a film' do

  scenario 'can enter the address and be saved to the database', js: true do
    visit '/'
    fill_in 'enterDestination', with: 'Makers Academy, London'
    click_button 'Go'
    sleep 1
    expect { click_button 'Add location' }.to change { Location.count }.by 1
  end

  scenario 'user must click on the map to create a marker', js: true do
    visit '/'
    click_button 'Add location'
    expect(page).to have_content 'Click on the map to add a marker'
  end

  context 'no locations have been added' do
    scenario 'should display a prompt to add a location (L01)' do
      visit '/locations'
      expect(page).to have_content 'No locations yet'
      expect(page).to have_button 'Add location'
    end
  end

  context 'locations have been added' do
    before do
      Location.create(name: 'Lewisham Fire Station')
    end

    scenario 'display locations (L02)' do
      visit '/locations'
      expect(page).to have_content('Lewisham Fire Station')
      expect(page).not_to have_content('No locations yet')
    end
  end


  context 'viewing locations' do

    let!(:lfs){Location.create(name:'Lewisham Fire Station')}

    scenario 'lets a user view a location (L04)' do
     visit '/locations'
     click_link 'Lewisham Fire Station'
     expect(page).to have_content 'Lewisham Fire Station'
     expect(current_path).to eq "/locations/#{lfs.id}"
    end

  end

end