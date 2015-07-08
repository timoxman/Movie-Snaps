require 'rails_helper'

feature 'A user wants to visit a film location' do

  context 'no locations have been added' do
    scenario 'should display a prompt to add a visit (V01)' do
      create_logged_in_user
      visit '/visits'
      expect(page).to have_content 'No visits yet'
      expect(page).to have_content "Add a visit"
    end
  end

  context 'visits can be added' do

    before do
      create_visit
    end

    scenario 'display locations (V02)' do
      visit '/visits'
      expect(page).to have_content('This was filmed here')
      expect(page).not_to have_content('No visits yet')
    end
  end



  context 'creating visits', js: true do
    let!(:louvre){Location.create(address:'Louvre Pyramid, 75001, Paris, France')}
    Visit.create(description:'On a nice sunny day I visited the Louvre')

    scenario 'lets a user create a visit (V04)' do
      visit '/locations'
      fill_in 'enterDBLocation', with: 'Louvre Pyramid, 75001, Paris, France'
      click_button 'Select Location'
      expect(page).to have_content 'Was it one of these films?'
      expect(current_path).to eq "/locations/#{louvre.id}/scenes"
    end
  end

end