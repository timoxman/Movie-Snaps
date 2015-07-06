class WelcomeController < ApplicationController

  def index
    @visits = Visit.first(5).reverse
    @photos = Photo.all
    @comment = Comment.new
  end

end
