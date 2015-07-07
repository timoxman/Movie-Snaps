class WelcomeController < ApplicationController

  def index
    @visits = Visit.first(5).reverse
    @photos = Photo.last(4).reverse
    @comment = Comment.new
    popular_group = Like.group(:photo_id).count.first(3)
    @popular = []
    popular_group.each { |p| @popular << Photo.find(p.first) }
  end

end
