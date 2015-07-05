class WelcomeController < ApplicationController

  def index
    @visits = Visit.first(5).reverse
    @photos = Photo.all
    @recents = Photo.last(5).reverse
    @comment = Comment.new
  end

end
