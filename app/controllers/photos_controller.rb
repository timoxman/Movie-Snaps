class PhotosController < ApplicationController

  def index
  end

  def new
    @visit = Visit.find(params[:visit_id])
    @scene = Scene.find(@visit.scene_id)
    @location = Location.find(@scene.location_id)
    @photo = Photo.new(photo_params)
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
