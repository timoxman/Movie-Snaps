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

feature 'User views a location profile page' do

  before do
    create_visit
    location = Location.last
    visit "/locations/#{location.id}"
  end

  scenario "displays location address" do
    expect(page).to have_content("Louvre Pyramid, 75001, Paris, France")
  end

  scenario "displays link to listed movie (associated by scenes)" do
    expect(page).to have_link("The Da Vinci Code (2006)")
  end

  scenario "displays scene photo of listed movie" do
    expect(page).to have_selector("img[src*='http://bit.ly/1JBfXCZ']")
  end

  scenario "displays user photo" do
    expect(page).to have_selector("img[src*='http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Da%20Vinci%20Code%20-%20The%20Pyramid%20Louvre%20-%20Fan%20Photo_zpsgixesmtr.jpg']")
  end

  scenario "displays a photo caption" do
    expect(page).to have_content("This was filmed here")
  end

  scenario "displays a user who has visited location" do
    expect(page).to have_content("John Doe")
  end

  scenario "displays correct number of scenes" do
    expect(page.all('ul.scenes li.scene').size).to eq(1)
  end

  scenario "displays correct number of visits" do
    expect(page.all('ul.visits li.visit').size).to eq(1)
  end

  scenario "displays correct number of photos" do
    expect(page.all('ul.photos li.photo').size).to eq(1)
  end

  xscenario "displays correct number of photos" do
    expect(page.all('ul.comments li.comment').size).to eq(1)
  end

end