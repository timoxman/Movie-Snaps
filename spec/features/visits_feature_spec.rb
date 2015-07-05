require 'rails_helper'

feature 'A user wants to visit a film location' do

  before do
    set_omniauth
    visit '/'
    click_link 'Sign in with Facebook'
    click_link 'here'
  end

  # scenario 'they enter address and the film to save it to the database', js: true do
  #   fill_in 'enterDestination', with: 'Makers Academy, London'
  #   click_button 'Visit'
  #   sleep 1
  #   click_button 'Place Marker'
  #   fill_in 'enterMovie', with: 'Shrek'
  #   expect { click_button 'Confirm Location' }.to change { Location.count }.by 1
  # end

  # scenario 'user must click on the map to create a marker', js: true do
  #   visit '/locations'
  #   click_button 'Confirm Location'
  #   expect(page).to have_content 'Click on the map to add a marker'
  # end

  context 'no locations have been added' do
    scenario 'should display a prompt to add a visit (V01)' do
      visit '/visits'
      expect(page).to have_content 'No visits yet'
      expect(page).to have_button 'Add a visit'
    end
  end

  context 'visits can be added' do
    before do
      let!(:ub){Movie.create(name:'Uncle Buck')}
      let!(:lfs){Location.create(address:'Lewisham Fire Station')}
      let!(:s1){Scene.create(location_id: lfs.id)}
      Visit.create(description: 'On a nice sunny day I visited Lewisham Fire Station')
    end

    scenario 'display locations (V02)' do
      visit '/visits'
      expect(page).to have_content('On a nice sunny day I visited Lewisham Fire Station')
      expect(page).not_to have_content('No visits yet')
    end
  end


  context 'creating visits ' do

    let!(:lfs){location.create(address:'Lewisham Fire Station')}
    let!(:v1){Visit.create(description:'On a nice sunny day I visited Lewisham Fire Station'')}


    scenario 'lets a user create a visit (V04)' do
     visit '/locations'
     click_link 'Lewisham Fire Station'
     expect(page).to have_content 'Was it one of these films?'
     expect(current_path).to eq "/locations/#{lfs.id}/scenes"
    end

  end

end