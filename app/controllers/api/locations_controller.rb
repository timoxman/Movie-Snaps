class Api::LocationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @locations = Location.all
    render json: @locations
  end

  def show
    @location = Location.find(params[:id])
    render json: @location
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      render json: {
        status: 200,
        message: "Successfully saved location",
        location: @location
      }.to_json
    else
      head 500
      puts "Not saved!"
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    render json: {
      status: 200,
      message: "Successfully deleted location"
    }.to_json
  end

  private
  def location_params
    params.require("location").permit("name", "description", "latitude", "longitude", "address")
  end
end


# authentication and scoping haven't been implemented so when crating new location, user_id is set to null
# (but we want it to be the user's id... need to look at this!)

# also saves locations with empty parameters atm! So name = "" is still saved...