require 'rails_helper'

def fill_autocomplete(field, options = {})
  fill_in field, with: options[:with]
  sleep 1
  page.execute_script %Q{ $('##{field}').trigger('keydown') }
  selector = %Q{ul.ui-autocomplete li.ui-menu-item a:contains("#{options[:select]}")}
  page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }
end

feature 'A user wants to add a location' do

  before(:each) do
    set_omniauth
    visit '/'
    click_link 'Sign in with Facebook'
    click_link 'here'
  end

  scenario 'and can enter the movie and have it autocompleted', js: true do
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
      Movie.create!(name:"The Da Vinci Code",imdbID:"tt0382625")
      fill_in 'enterDestination', with: 'Makers Academy, London'
      click_button 'Visit'
      click_button 'Place Marker'
      fill_in('enterMovie', with: 'The Da Vinci Code')
      expect { click_button 'Confirm Location' }.to change { Movie.count }.by 0
    end
  end

  context 'in an existing location' do
    scenario 'can add a new movie', js: true do
      user = User.create(:name => 'John Doe', :email => 'john1@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')
      movie = Movie.create(name:"The Da Vinci Code",imdbID:"tt0382625")
      location = Location.create(user_id: user.id,name:"", description:"Da Vinci Code", latitude:48.860000000000000000,longitude:2.341111100000034600,address:"Louvre Pyramid, 75001, Paris, France")
      Scene.create(movie_id: movie.id,location_id: location.id, image_file_name:"http://bit.ly/1JBfXCZ")
      click_link 'Louvre Pyramid, 75001, Paris, France'
      click_link 'click here'
      fill_autocomplete('enterMovie', with: 'Shrek')
      expect { click_button 'Add movie' }.to change { Movie.count }.by 1
    end

  end

end