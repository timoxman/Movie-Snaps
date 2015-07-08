class LocationsController < ApplicationController

  def index
  end

  def new
    lat = params[:posa]
    lng = params[:posf]
    address = params[:address]
    location = Location.where("latitude = ? AND longitude = ? AND address = ?", lat,lng,address).first_or_create(latitude: lat, longitude: lng, address: address)
    film = params[:film]
    movie = Movie.where("name = ?",film).first_or_create(name: film)
    scene = Scene.where("movie_id = ? AND location_id = ?",movie.id,location.id).first_or_create(movie_id: movie.id, location_id: location.id)
    redirect_to new_scene_visit_path(scene.id)
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
