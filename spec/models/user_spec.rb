describe User, type: :model do

  it { is_expected.to have_many :locations }
  it { is_expected.to have_many :visits }
  it { is_expected.to have_many :likes }
  it { is_expected.to have_many :comments }

end