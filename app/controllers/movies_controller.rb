class MoviesController < ApplicationController

  def create
    film_name = params[:name]
    location = params[:location]
    film = Movie.first_or_create(name: film_name)
    scene = Scene.first_or_create(movie_id: film.id, location_id: location)
    redirect_to new_scene_visit_path(scene.id)
  end

  def index
  end

  def show
    @movie = Movie.find(params[:id])
    @comment = Comment.new
  end

  def api
    @movies = Movie.all
    render json: @movies.to_json
  end

end