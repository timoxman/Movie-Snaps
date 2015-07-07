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
    click_button 'Go!'
    sleep 1
    click_button 'Place Marker'
    fill_in 'enterMovie', with: 'Shrek'
    expect { click_button 'Submit Visit' }.to change { Location.count }.by 1
  end

  scenario 'user must click on the map to create a marker', js: true do
    visit '/locations'
    expect(page).not_to have_button 'Submit Visit'
  end

  context 'locations have been added' do
    scenario 'display locations (L02)', js: true do
      Location.create(address: 'Louvre Pyramid, 75001, Paris, France')
      visit '/locations'
      fill_in 'enterDBLocation', with: 'Louvre Pyramid, 75001, Paris, France'
      click_button 'Select Location'
      expect(page).to have_content('Louvre Pyramid, 75001, Paris, France')
    end
  end

  context 'viewing locations' do
    let!(:ginza){Location.create(address:'Ginza, Chuo, Tokyo 104-0061, Japan')}

    scenario 'lets a user view movies associated with a location (L04)', js: true do
      visit '/locations'
      fill_in 'enterDBLocation', with: 'Ginza, Chuo, Tokyo 104-0061, Japan'
      click_button 'Select Location'
      expect(page).to have_content 'Was it one of these films?'
      expect(current_path).to eq "/locations/#{ginza.id}/scenes"
    end
  end

end

feature 'User views the location index page' do

  before do
    create_visit
    visit '/locations'
  end

  scenario 'enters a location in database and have it autocompleted', js: true do
    fill_autocomplete('enterDBLocation', with: 'Louvre Pyramid, 75001, Paris, France')
    expect(page).to have_selector('ul.ui-autocomplete li.ui-menu-item')
  end

  scenario 'enters a location not in database and not have it autocompleted', js: true do
    fill_autocomplete('enterDBLocation', with: 'Wollaton Hall & Deer Park, Nottingham NG8 2AE')
    expect(page).not_to have_selector('ul.ui-autocomplete li.ui-menu-item')
  end

  scenario 'enters a location not in database and sees error message', js: true do
    fill_autocomplete('enterDBLocation', with: 'Wollaton Hall & Deer Park, Nottingham NG8 2AE')
    click_button 'Select Location'
    expect(page).to have_content('Location not yet in database')
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

  xscenario "displays correct number of comments" do
    expect(page.all('ul.comments li.comment').size).to eq(1)
  end

end