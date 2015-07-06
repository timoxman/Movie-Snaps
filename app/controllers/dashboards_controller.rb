class DashboardsController < ApplicationController

  def index
    @visits = Visit.all
    @movies = Movie.all
    #@movies = Movie.joins(:visits)
  end

end
