class WelcomeController < ApplicationController

  def index
    @visits = Visit.first(5).reverse
    @photos = Photo.all.reverse
    @comment = Comment.new
  end

end
