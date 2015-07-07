class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create(user_id: current_user.id)
    render json: {new_like_count: @photo.likes.count}
  end

end
