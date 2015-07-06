class Visit < ActiveRecord::Base

  has_many :photos
  belongs_to :scene
  belongs_to :user
  accepts_nested_attributes_for :photos

  validates_date :date_visited, :on_or_before => lambda { Date.current }
  validates_length_of :description, :maximum => 40, :minimum => 1, :message => "Uh oh! You have over 40 characters!"

end
