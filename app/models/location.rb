class Location < ActiveRecord::Base

  belongs_to :user
  has_many :scenes

  validates_length_of :latitude, :minimum => 1, :message => "No latitude provided!"
  validates_length_of :longitude, :minimum => 1, :message => "No longitude provided!"

end
