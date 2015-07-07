class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @visits = Visit.where("user_id = ?", @user.id)
  end

end