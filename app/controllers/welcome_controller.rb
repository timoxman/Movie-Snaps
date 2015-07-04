class WelcomeController < ApplicationController

  def index
    # byebug
    @photos = Photo.all
  end
end
