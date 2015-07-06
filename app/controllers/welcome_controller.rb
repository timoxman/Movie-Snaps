class WelcomeController < ApplicationController

  def index
    @photos = Photo.all
    @comment = Comment.new
  end

end
