class ScenesController < ApplicationController

  def index
    @location = Location.find(params[:location_id])
    @scenes = Scene.where("location_id = ?", params[:location_id]).all
  end

  def new
    if !current_user
      flash[:notice] = 'Please sign in first'
      redirect_to '/'
    end
  end

  def create
    lat = params[:posa]
    lng = params[:posf]
    address = params[:address]
    location = Location.where("latitude = ? AND longitude = ? AND address = ?", lat,lng,address).first_or_create(latitude: lat, longitude: lng, address: address)
    film = params[:film]
    movie = Movie.where("name = ?",film).first_or_create(name: film)
    scene = Scene.where("movie_id = ? AND location_id = ?",movie.id,location.id).first_or_create(movie_id: movie.id, location_id: location.id)
    redirect_to new_scene_visit_path(scene.id)
  end

  def api
    @lat = params[:posa]
    @lng = params[:posf]
    @address = params[:address]
    @location = Location.where("latitude = ? AND longitude = ? AND address = ?", @lat, @lng, @address).first
    @movie_name = params[:film]
    @movie = Movie.where("name = ?", @movie_name).first
    @scene = Scene.where("movie_id = ? AND location_id = ?", @movie.id, @location.id).first
    render json: @scene.to_json
  end

end
