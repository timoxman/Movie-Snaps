class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @visits = Visit.where("user_id = ?", @user.id)
  end

end

# Scene.where("movie_id = ? AND location_id = ?",movie.id,location.id)