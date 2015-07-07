require 'rails_helper'

feature 'A user on the homepage' do

  context 'while logged in' do

    before(:each) do
      create_visit
    end

    xscenario 'can comment on other user\'s photo', js: true do
      click_button 'Comment'
      fill_in 'comment_remark', with: 'Nice photo!'
      expect { click_button 'Submit' }.to change { Comment.count }.by 1
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

    xscenario 'is not allowed to comment' do
      expect(page).not_to have_content 'Comment'
    end

    xscenario 'can see comments already created' do
      expect(page).to have_content 'Nice photo! John Doe'
    end

  end
end