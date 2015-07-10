require 'rails_helper'

describe Comment do

  it { is_expected.to belong_to :photo }

  it 'must not be an empty remark' do
  	Comment.create()
  	expect(Comment.count).to eq 0
  end

end