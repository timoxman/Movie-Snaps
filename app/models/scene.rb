class Scene < ActiveRecord::Base

  belongs_to :movie
  belongs_to :location
  has_many :visits

end
