class VisitsController < ApplicationController

  def index
    @scenes = Scene.all
    @visits = Visit.all
  end

  def new
    @location = Location.find(params[:location_id])
    @scene = Scene.find(params[:scene_id])
    @current_visits = Visit.where("scene_id = ?", params[:scene_id]).all
    @visit = Visit.new
    @movie = @scene.movie.name
    # raise params[:scene_id]
    if params[:scene_id] == 0
      raise "go off and create a movie, location and scene"
    end
  end

  def create
    @visit = Visit.create(visit_params.merge({user:current_user}).merge({scene_id: params[:scene_id]}))
    redirect_to new_location_scene_visit_photo_path(params[:location_id],params[:scene_id], @visit)
  end

  # define which params we are going to allow us to pass to controller, without this security flaw.
  def visit_params
    params.require(:visit).permit(:description, :date_visited )
  end

end
