class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    lat = params[:posa]
    lng = params[:posf]
    address = params[:address]
    #why in new not create and why not need location_params
    location = Location.create(latitude: lat, longitude: lng, address: address, user_id: current_user.id)
    film = params[:film]
    movie = Movie.where("name = ?",film).first_or_create(name: film)
    scene = Scene.where("movie_id = ? AND location_id = ?",movie.id,location.id).first_or_create(movie_id: movie.id, location_id: location.id)
    redirect_to new_scene_visit_path(scene.id)
  end

  def create
  end

  # define which params we are going to allow us to pass to controller, without this security flaw.
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
