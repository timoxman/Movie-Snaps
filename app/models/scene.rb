class Scene < ActiveRecord::Base

  belongs_to :movie
  belongs_to :location
  has_many :visits

  validates_length_of :movie_id, :minimum => 1, :message => "Can't create a scene without a movie!"
  validates_length_of :location_id, :minimum => 1, :message => "Can't create a scene without a location!"

end
