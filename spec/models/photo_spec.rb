require 'rails_helper'

describe Photo do

  it { is_expected.to belong_to :visit }
  it { is_expected.to have_many :likes }

  # has_attached_file :image,
  #   :path => ":rails_root/public/images/:id/:filename",
  #   :url  => "/images/:id/:filename"

end