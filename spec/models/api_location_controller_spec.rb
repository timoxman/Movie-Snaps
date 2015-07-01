require 'spec_helper'
require './app/controllers/api/locations_controller'

describe Api::LocationsController, 'GET index', type: :controller do
  it 'returns a list of locations' do
    FactoryGirl.create(:location)
    get :index
    result = JSON.load(response.body)
    expect(result.first['name']).to eq 'My Happy Place'
  end

# is there a way to use FactoryGirl to add to our database
  xit 'creates a location' do
  	params = {:location => {name: "Name", description: "lovely", latitute: 7, longitude: 6, address: 5}}
    post :create, {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json',  'RAW_POST_DATA' => params.to_json}
    puts response.body
    expect(JSON.parse(response.body)).to eq 'Far Far Away'
  end
end



