class Photo < ActiveRecord::Base

  belongs_to :visit
  has_many :likes
  has_many :comments

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:styles/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_inclusion_of :image, :in => %w( jpg gif png jpeg ), :message => "extension {{value}} is not included in the list"
  # validates_format_of :image, :with => %r{\.(png|jpg|jpeg)$}i, :message => "whatever"

end
