require 'rails_helper'

describe Photo do

  it { is_expected.to belong_to :visit }
  it { is_expected.to have_many :likes }

  it 'expects an image to be uploaded as a jpg, jpeg or png' do
  	Photo.create(image_file_name:"somedoc.doc")
  	expect(Photo.count).to eq 0
  	Photo.create(image_file_name:"somephoto.jpg")
  	expect(Photo.count).to eq 1
  end

end