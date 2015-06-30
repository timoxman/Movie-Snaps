require 'rails_helper'

feature 'locations' do

  context 'no locations have been added' do
    scenario 'should display a prompt to add a location (L01)' do
      visit '/locations'
      expect(page).to have_content 'No locations yet'
      expect(page).to have_link 'Add a location'
    end
  end

  xcontext 'locations have been added' do
    before do
      Location.create(name: 'Lewisham Fire Station')
    end

    scenario 'display locations (L02)' do
      visit '/locations'
      expect(page).to have_content('Lewisham Fire Station')
      expect(page).not_to have_content('No locations yet')
    end
  end

  xcontext 'creating locations' do
    scenario 'prompts user to fill out a form, then displays the new location (L03)' do
      visit '/locations'
      click_link 'Add a location'
      fill_in 'name', with: 'Lewisham Fire Station'
      click_button 'Create Location'
      expect(page).to have_content 'Lewisham Fire Station'
      expect(current_path).to eq '/locations'
    end
  end

 xcontext 'viewing locations' do

  let!(:lfs){Location.create(name:'Lewisham Fire Station')}

  scenario 'lets a user view a location (L04)' do
   visit '/locations'
   click_link 'Lewisham Fire Station'
   expect(page).to have_content 'Lewisham Fire Station'
   expect(current_path).to eq "/locations/#{lfs.id}"
  end

end

end