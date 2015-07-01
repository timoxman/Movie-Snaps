class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    lat = params[:posa]
    lng = params[:posf]
    address = params[:address]
    new_location = Location.new(latitude: lat, longitude: lng, address: address, user_id: current_user.id)
    new_location.save
    redirect_to '/'
  end

  def create
  end

  # define which params we are going to allow us to pass to controller, without this security flaw.
  def location_params
    params.require(:location).permit(:name, :description, :latitude, :longitude, :address)
  end

  def show
    @location = Location.find(params[:id])
  end

  def api
    @locations = Location.all
    render json: @locations.to_json
  end

end
