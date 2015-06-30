class Visit < ActiveRecord::Base

  has_many :photos
  belongs_to :scene
  belongs_to :user

end
