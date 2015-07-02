class ScenesController < ApplicationController

  def index
    @location = Location.find(params[:location_id])
    @scenes = Scene.where("location_id = ?", params[:location_id]).all
  end

  def new
    @location = Location.find(params[:location_id])
    @scene = Scene.new
  end
end
