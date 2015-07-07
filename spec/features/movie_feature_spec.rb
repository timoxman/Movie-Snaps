require 'rails_helper'

feature 'A user wants to add a movie' do

  before(:each) do
    create_visit
    click_link 'here'
  end

  scenario 'but cannot enter a movie before a location', js: true do
    expect(page).not_to have_button 'Confirm Location'
  end

  scenario 'and can enter the movie and have it autocompleted', js: true do
    fill_in 'enterDestination', with: 'Makers Academy, London'
    click_button 'Visit'
    click_button 'Place Marker'
    fill_autocomplete('enterMovie', with: 'Shrek')
    expect(page).to have_selector('ul.ui-autocomplete li.ui-menu-item')
  end

  context 'when entering a new location' do
    scenario 'can enter a new movie and be saved', js: true do
      fill_in 'enterDestination', with: 'Makers Academy, London'
      click_button 'Visit'
      click_button 'Place Marker'
      fill_autocomplete('enterMovie', with: 'Shrek')
      expect { click_button 'Confirm Location' }.to change { Movie.count }.by 1
    end

    scenario 'can enter a duplicate movie, and it will not be saved' do
      fill_in 'enterDestination', with: 'Makers Academy, London'
      click_button 'Visit'
      click_button 'Place Marker'
      fill_in('enterMovie', with: 'The Da Vinci Code')
      expect { click_button 'Confirm Location' }.to change { Movie.count }.by 0
    end
  end

  context 'in an existing location' do
    scenario 'can add a new movie', js: true do
      click_link 'Louvre Pyramid, 75001, Paris, France'
      fill_autocomplete('enterMovie', with: 'Shrek')
      expect { click_button 'Add movie' }.to change { Movie.count }.by 1
    end

  end

end

feature 'User views an individual movie page' do

  before do
    create_visit
    movie = Movie.last
    visit "/movies/#{movie.id}"
  end

  xscenario "can click on movie and see the movie page" do
  end

  scenario "can see movie title" do
    expect(page).to have_content("The Da Vinci Code (2006)")
  end

  scenario "has link with address" do
    expect(page).to have_link("Louvre Pyramid, 75001, Paris, France")
  end

  scenario "has scene photo" do
    expect(page).to have_selector("img[src*='http://bit.ly/1JBfXCZ']")
  end

  scenario "has fan photo" do
    expect(page).to have_selector("img[src*='http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Da%20Vinci%20Code%20-%20The%20Pyramid%20Louvre%20-%20Fan%20Photo_zpsgixesmtr.jpg']")
  end

  scenario "has a caption" do
    expect(page).to have_content("This was filmed here")
  end

  scenario "has a user" do
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

feature 'User views the movie index page' do

  before do
    create_visit
    visit '/movies'
  end

  scenario 'enters a movie in database and have it autocompleted', js: true do
    fill_autocomplete('enterMovie', with: 'Da Vinci')
    expect(page).to have_selector('ul.ui-autocomplete li.ui-menu-item')
  end

  scenario 'enters a movie not in database and not have it autocompleted', js: true do
    fill_autocomplete('enterMovie', with: 'Drive')
    expect(page).not_to have_selector('ul.ui-autocomplete li.ui-menu-item')
  end

end