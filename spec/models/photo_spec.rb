require 'rails_helper'

describe Photo do

  it { is_expected.to belong_to :visit }
  it { is_expected.to have_many :likes }

  it 'can be added to the database through a visit' do
    set_omniauth
    Location.create(id:1,latitude:0,longitude:0,description:"This is a location")
    Movie.create(id:1,name:"Dude, Where's My Test?")
    Scene.create(id:1,image_file_name:"some.jpg")
    Visit.create(id:1,date_visited:"2015-07-03")
    expect(Photo.create(image_file_name:"some.jpg", visit_id:1)).to be_valid
  end

end