class PhotosController < ApplicationController

  def index
  end

  def new
    @location = Location.find(params[:location_id])
    @scene = Scene.find(params[:scene_id])
    @visit = Visit.find(params[:visit_id])
    @photo = Photo.new
  end

  def create
    # redirect_to '/visits'
    Photo.create(photo_params.merge({visit_id: params[:visit_id]}))
    redirect_to '/'
  end

  # define which params we are going to allow us to pass to controller, without this security flaw.

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

end
