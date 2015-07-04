require 'rails_helper'

feature 'User clicks on a previously added location' do

  before(:each) do
    User.create! :name => 'John Doe', :email => 'john1@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
    Location.create!(user_id:1,name:"", description:"Da Vinci Code", latitude:48.860000000000000000,longitude:2.341111100000034600,address:"Louvre Pyramid, 75001, Paris, France")
    Movie.create!(name:"The Da Vinci Code",imdbID:"tt0382625")
    Scene.create!(movie_id:1,location_id:1,image_file_name:"http://bit.ly/1JBfXCZ")
    visit locations_path
    click_link 'Louvre Pyramid, 75001, Paris, France'
  end

  scenario 'and sees a list of movies associated with it', js: true do
    expect(page).to have_content 'The Da Vinci Code'
  end

  scenario 'has the option to add a new scene to that movie', js: true do
    click_link 'The Da Vinci Code'
    expect(page).to have_content 'Tell us something about your visit'
  end

  scenario 'has the option to add a new movie', js: true do
    click_link 'click here'
    expect(page).to have_content 'Add your movie for Louvre Pyramid, 75001, Paris, France'
  end
end