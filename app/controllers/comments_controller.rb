class CommentsController < ApplicationController

  def create
    photo = Photo.find(params[:photo_id])
    @comment = current_user.comments.create(comment_params)
    @comment.photo_id = photo.id
    @comment.save
    redirect_to root_path
  end

  def comment_params
    params.require(:comment).permit(:remark)
  end
end
