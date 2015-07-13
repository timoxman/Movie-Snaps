class WelcomeController < ApplicationController

  def index
    @photos = Photo.last(8).reverse
    @comment = Comment.new
    popular_group = Like.group(:photo_id).count.first(3)
    @popular = []
    popular_group.each { |p| @popular << Photo.find(p.first) }
  end

end
