require 'rails_helper'

describe Location do

  it { is_expected.to belong_to :user }

  it 'can be added to the database with latitude, longitude and address' do
  	Location.create(latitude:0,longitude:0,address:"A nice spot")
  	expect(Location.count).to eq 1
  end

  it 'must have a latitude' do
  	Location.create(longitude:0,address:"A nice spot")
  	expect(Location.count).to eq 0
  end

  it 'must have a longitude' do
  	Location.create(latitude:0,address:"A nice spot")
  	expect(Location.count).to eq 0
  end

end