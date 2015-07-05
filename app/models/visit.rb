class Visit < ActiveRecord::Base

  has_many :photos
  belongs_to :scene
  belongs_to :user

  validates_date :date_visited, :on_or_before => lambda { Date.current }
  validates_length_of :description, :maximum => 40, :minimum => 1, :message => "Hello"


end
