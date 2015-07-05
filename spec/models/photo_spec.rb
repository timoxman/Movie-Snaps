require 'rails_helper'

describe Photo do

  it { is_expected.to belong_to :visit }
  it { is_expected.to have_many :likes }

  it 'expects an image to be uploaded as a jpg' do
  end

end