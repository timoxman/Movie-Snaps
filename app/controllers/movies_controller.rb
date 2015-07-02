class MoviesController < ApplicationController

  def new
    film_name = params[:name]
    location = Location.find_by(address: params[:location])
    film = Movie.create(name: film_name)
    scene = Scene.create(movie_id: film.id, location_id: location.id)
    redirect_to '/'
  end
end
