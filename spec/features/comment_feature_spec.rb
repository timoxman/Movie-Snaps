require 'rails_helper'

feature 'A user on the homepage' do

  before(:each) do
    create_visit
  end

  context 'while logged in' do
    scenario 'can comment on other users photo', js: true do
      click_link 'Comment'
      expect(page).to have_content 'Leave a comment'
      fill_in 'comment_remark', with: 'Nice photo!'
      click_button 'Comment'
      expect(Comment.count).to eq 1
      expect(current_path).to eq root_path
      # expect(page).to have_content 'Nice photo!'
    end
  end
end