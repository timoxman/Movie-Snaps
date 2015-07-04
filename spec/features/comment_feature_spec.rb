require 'rails_helper'

feature 'A user on the homepage' do

  context 'while logged in' do

    before(:each) do
      create_visit
    end

    scenario 'can comment on other users photo', js: true do
      click_link 'Comment'
      expect(page).to have_content 'Leave a comment'
      fill_in 'comment_remark', with: 'Nice photo!'
      click_button 'Comment'
      expect(Comment.count).to eq 1
      expect(current_path).to eq root_path
      expect(page).to have_content 'Nice photo! John Doe'
    end

  end

  context 'while logged out' do

    before(:each) do
      create_visit
      p = Photo.first
      u = User.first
      Comment.create(remark: 'Nice photo!', photo_id: p.id, user_id: u.id)
      visit '/'
      click_link 'Sign out'
    end

    scenario 'is not allowed to comment' do
      expect(page).not_to have_content 'Comment'
    end

    scenario 'can see comments already created' do
      expect(page).to have_content 'Nice photo! John Doe'
    end

  end
end