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
      create_logged_in_user
      visit new_scene_path
      fill_in 'enterDBLocation', with: 'Louvre Pyramid, 75001, Paris, France'
      click_button 'Select Location'
      expect(page).to have_content 'Was it one of these films?'
      expect(current_path).to eq "/locations/#{louvre.id}/scenes"
    end

    scenario 'can create a visit and save it to the database', js: true do
      create_visit
      click_link 'Upload photos'
      fill_in 'enterDBLocation', with: 'Louvre Pyramid, 75001, Paris, France'
      click_button 'Select Location'
      click_link "The Da Vinci Code"
      fill_in 'visit_visit_description', with: 'Ate a croissant'
      fill_in 'visit_photo_caption', with: 'Me, my croissant and Le Louvre'
      attach_file 'visit_photo_image', './public/images/bond.jpg'
      expect { click_button 'Submit' }.to change { Visit.count }.by 1
    end
  end

end
