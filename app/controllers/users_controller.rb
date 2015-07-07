class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @visits = Visit.where("user_id = ?", @user.id)
    @comment = Comment.new
  end

  def movies_api
    movies = []
    User.find(params[:id]).visited_scenes.each do |visited_scene|
      movies << visited_scene.movie
    end
    render json: movies.to_json
  end

  def locations_api
    locations = []
    User.find(params[:id]).visited_scenes.each do |visited_scene|
      locations << visited_scene.location
    end
    render json: locations.to_json
  end

end