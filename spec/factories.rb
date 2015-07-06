FactoryGirl.define do

  factory :photo do
    photo { File.new("#{Rails.root}/spec/models/somepic.jpg") } 
  end

end