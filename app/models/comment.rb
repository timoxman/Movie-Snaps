class Comment < ActiveRecord::Base

  belongs_to :photo
  belongs_to :user

  validates_length_of :remark, :minimum => 1, :message => "Can't create a comment without a string!"

end
