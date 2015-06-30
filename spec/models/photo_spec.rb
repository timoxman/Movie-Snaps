describe Photo do

  it { is_expected.to belong_to :visit }
  it { is_expected.to have_many :likes }

end