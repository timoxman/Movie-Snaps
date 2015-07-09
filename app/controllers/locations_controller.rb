class LocationsController < ApplicationController

  def index
  end

  def location_params
    params.require(:location).permit(:name, :description, :latitude, :longitude, :address)
  end

  def show
    @location = Location.find(params[:id])
    @comment = Comment.new
  end

  def api
    @locations = Location.all
    render json: @locations.to_json
  end

end
