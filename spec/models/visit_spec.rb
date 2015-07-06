require 'rails_helper'

describe Visit do

  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :scene }

  # NEED TO FEATURE TEST THAT THIS PAGE GIVES ERROR IF WRONG DATE GIVEN
  it 'a visit can only be added for all days before and including today\'s date' do
    Visit.create(date_visited:"Fri, 03 Jul 4015",description:"Some description")
    expect(Visit.count).to eq 0
    Visit.create(date_visited:"Fri, 03 Jul 1066",description:"Some description")
    expect(Visit.count).to eq 1
  end

  it 'will only accept a description with 40 characters or less' do
    fortyone_chars = "12345678901234567890123456789012345678901"
    forty_chars = "1234567890123456789012345678901234567890"
    Visit.create(description:fortyone_chars,date_visited:"Fri, 03 Jul 1066")
    expect(Visit.count).to eq 0
    Visit.create(description:"test",date_visited:"Fri, 03 Jul 1066")
    expect(Visit.count).to eq 1
    Visit.create(description:forty_chars,date_visited:"Fri, 03 Jul 1066")
    expect(Visit.count).to eq 2
  end

  it 'does not accept empty descriptions' do
    Visit.create(description:"",date_visited:"Fri, 03 Jul 1066")
    expect(Visit.count).to eq 0
    Visit.create(description:"I love life",date_visited:"Fri, 03 Jul 1066")
    expect(Visit.count).to eq 1
  end

  # it 'will not post a visit if a photo is not uploaded' do
  # end

end