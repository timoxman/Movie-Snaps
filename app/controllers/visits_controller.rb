class VisitsController < ApplicationController

  def index
    @scenes = Scene.all
    @visits = Visit.all
  end

  def new
    @scene = Scene.find(params[:scene_id])
    @location = Location.find(@scene.location_id)
    @current_visits = Visit.where("scene_id = ?", params[:scene_id]).all
    @visit = Visit.new
    @movie = @scene.movie.name
    @photo = Photo.new
  end

  def create
    @visit = Visit.create(visit_params.merge({user:current_user}).merge({scene_id: params[:scene_id]}))
    @photo = Photo.create(photo_params.merge({visit_id: @visit.id}))
    redirect_to root_path
  end

  def visit_params
    params.require(:visit).permit![:visit]
  end

  def photo_params
    params.require(:visit).permit![:photo]
  end

end

    # def new
    # @location = Location.where("latitude = ? AND longitude = ? AND address = ?", params[:posa], params[:posf], params[:address])
    # @movie = Movie.where("name = ?", params[:film])
    # @scene = Scene.where("location_id = ? AND movie_id = ?", @location.id, @movie.id)
    # # @scene = Scene.find(params[:scene_id])
    # # @location = Location.find(@scene.location_id)
    # # @current_visits = Visit.where("scene_id = ?", params[:scene_id]).all
    # @visit = Visit.new
    # # @movie = @scene.movie.name
    # # @photo = Photo.new
    # end

  # def new
  #   if params[:scene_id] == 0
  #     raise "go off and create a movie, location and scene"
  #   end
  #   @scene = Scene.find(params[:scene_id])
  #   @location = Location.find(@scene.location_id)
  #   @current_visits = Visit.where("scene_id = ?", params[:scene_id]).all
  #   @visit = Visit.new
  #   @movie = @scene.movie.name
  #   @photo = Photo.new
  # end