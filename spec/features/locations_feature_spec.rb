require 'rails_helper'

feature 'locations' do

  context 'no locations have been added' do
    scenario 'should display a prompt to add a location (L01)' do
      visit '/locations'
      expect(page).to have_content 'No locations yet'
      expect(page).to have_link 'Add a location'
    end
  end

  context 'restaurants have been added' do
    before do
      Location.create(name: 'Lewisham Fire Station')
    end

    scenario 'display locations (L02)' do
      visit '/locations'
      expect(page).to have_content('Lewisham Fire Station')
      expect(page).not_to have_content('No restaurants yet')
    end
end

end