require 'rails_helper'

describe Visit do

  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :scene }

  # visit.date_visited should not be later than the date of posting the visit
  it 'a visit cannot be posted for a future date' do
    visit = Visit.create(date_visited:"Fri, 03 Jul 3015")
    expect(Visit.count).to eq 0
  end

end