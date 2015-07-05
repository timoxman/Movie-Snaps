class WelcomeController < ApplicationController

  def index
    @photos = Photo.all.reverse
    @comment = Comment.new
  end

end
