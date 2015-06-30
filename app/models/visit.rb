class Visit < ActiveRecord::Base

  belongs_to :scene
  belongs_to :user

end
