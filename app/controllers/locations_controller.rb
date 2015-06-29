class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    Location.create(location_params)
    redirect_to '/locations'
  end

  # define which params we are going to allow us to pass to controller, without this security flaw.
  def location_params
    params.require(:location).permit(:name, :description, :film, :latitude, :longitude, :address)
  end

  def show
    @location = Location.find(params[:id])
  end

end
