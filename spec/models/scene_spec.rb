describe Scene do

  before(:each) do
  	set_omniauth
  	Location.create(id:1,latitude:0,longitude:0,description:"This is a location")
  	Movie.create(id:1,name:"Dude, Where's My Test?")
  end

  it { is_expected.to belong_to :location }
  it { is_expected.to belong_to :movie }

  it 'can be created with movie and location' do
  	Scene.create(movie_id:1,location_id:1,image_file_name:"somepic.jpg")
  	expect(Scene.count).to eq 1
  end

  it 'cannot be created without a movie' do
  	Scene.create(location_id:1,image_file_name:"somepic.jpg")
  	expect(Scene.count).to eq 0
  end

  it 'cannot be created unless there is a location' do
  	Scene.create(movie_id:1,image_file_name:"somepic.jpg")
  	expect(Scene.count).to eq 0
  	Scene.create(movie_id:1,location_id:1,image_file_name:"somepic.jpg")
  	expect(Scene.count).to eq 1
  end

  xit 'must have an image link or image file' do
  end

end