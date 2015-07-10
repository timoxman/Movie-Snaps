describe Location do

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :scenes }

  it 'can be added to the database with latitude, longitude and address' do
  	Location.create(latitude:0,longitude:0,address:"A nice spot")
  	expect(Location.count).to eq 1
  end

end