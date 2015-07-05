class WelcomeController < ApplicationController

  def index
    @photos = Photo.all
    @recents = Photo.last(5).reverse
    @comment = Comment.new
  end

end
