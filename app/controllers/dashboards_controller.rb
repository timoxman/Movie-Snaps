class DashboardsController < ApplicationController

  def index
    @visits = Visit.all

    @scenes = Scene.includes(:movie)
    @scene_table_data =[]
    @scenes.each do | scene |
      movie_found = false
      @scene_table_data.each_with_index do |item, i|
        if item[0] == scene.movie.name
          @scene_table_data[i][1] +=1
          movie_found = true
        end
      end
      if !movie_found
        new_item =[]
        new_item[0] = scene.movie.name
        new_item[1] = 1
        @scene_table_data.push(new_item)
      end
    end

    @visits2 = Visit.includes(:user).all
    @user_table_data =[]
    @visits2.each do | visit |
      user_found = false
      @user_table_data.each_with_index do |item, i|
        if item[0] == visit.user.name
          @user_table_data[i][1] +=1
          user_found = true
        end
      end
      if !user_found
        new_item =[]
        new_item[0] = visit.user.name
        new_item[1] = 1
        @user_table_data.push(new_item)
      end
    end
  end

  @location_table_data = [['Chad',400],['France',600]]


end
