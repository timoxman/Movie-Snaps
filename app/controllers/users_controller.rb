class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @visits = Visit.where("user_id = ?", @user.id)
    @comment = Comment.new
  end

  def index
  end

  def api
    @users = User.all
    render json: @users.to_json
  end

end