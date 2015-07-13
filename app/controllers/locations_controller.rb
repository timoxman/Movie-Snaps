class LocationsController < ApplicationController

  def index
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
