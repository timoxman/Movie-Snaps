class MoviesController < ApplicationController

  def create
    film_name = params[:name]
    location = params[:location]
    film = Movie.create(name: film_name)
    scene = Scene.create(movie_id: film.id, location_id: location)
    redirect_to new_location_scene_visit_path(location, scene.id)
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
