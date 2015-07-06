require 'rails_helper'

describe Photo do

  it { is_expected.to belong_to :visit }
  it { is_expected.to have_many :likes }

  it 'can be added to the database' do

  end

end