require 'rails_helper'

feature 'A user wants to view another user\'s profile page' do
  context 'viewing user details' do

    scenario 'displays user name', js: true do
      user = create_logged_in_user
      visit "/users/#{user.id}"
      expect(page).to have_content('User page of John Doe')
      expect(page).to have_css 'img#user_img'
    end
  end

  context 'viewing user visits' do
    scenario 'displays visit location' do
      # byebug
      user = create_logged_in_user
      movie = Movie.create(name:"The Da Vinci Code",imdbID:"tt0382625")
      location = Location.create(user_id: user.id,name:"", description:"Da Vinci Code", latitude:48.860000000000000000,longitude:2.341111100000034600,address:"Louvre Pyramid, 75001, Paris, France")
      scene = Scene.create(movie_id: movie.id,location_id: location.id, image_file_name:"http://bit.ly/1JBfXCZ")
      visit = Visit.create(scene_id: scene.id,user_id: user.id, description: 'This was filmed here')
      Photo.create(caption:"Outside Le Louvre!",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Da%20Vinci%20Code%20-%20The%20Pyramid%20Louvre%20-%20Fan%20Photo_zpsgixesmtr.jpg",visit_id: visit.id)
      visit "/users/#{user.id}"
      expect(page).to have_content('Louvre Pyramid, 75001, Paris, France')
    end
  end
end
