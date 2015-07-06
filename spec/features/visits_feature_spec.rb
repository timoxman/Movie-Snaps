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


  context 'creating visits ' do

    let!(:lfs){Location.create(address:'Lewisham Fire Station')}
    let!(:v1){Visit.create(description:'On a nice sunny day I visited Lewisham Fire Station')}


    scenario 'lets a user create a visit (V04)' do
     visit '/locations'
     click_link 'Lewisham Fire Station'
     expect(page).to have_content 'Was it one of these films?'
     expect(current_path).to eq "/locations/#{lfs.id}/scenes"
    end

  end

end