class Photo < ActiveRecord::Base

  belongs_to :visit
  has_many :likes
  has_many :comments

end
