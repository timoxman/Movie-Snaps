require 'rails_helper'

feature 'On the user page' do
  context 'while logged in' do

    before(:each) do
      create_visit
      u = User.first
      visit "/users/#{u.id}"
    end

    scenario 'can comment on other user\'s photo', js: true do
      click_button 'Comment'
      fill_in 'comment_remark', with: 'Nice photo!'
      expect { click_button 'Submit' }.to change { Comment.count }.by 1
      expect(page).to have_content 'John Doe: Nice photo!'
    end
  end

  context 'while logged out' do

    before(:each) do
      create_visit
      p = Photo.first
      u = User.first
      Comment.create(remark: 'Nice photo!', photo_id: p.id, user_id: u.id)
      click_link 'Sign out'
      visit "/users/#{u.id}"
    end

    scenario 'is not allowed to comment' do
      expect(page).not_to have_content 'Comment'
    end
    scenario 'can see comments already created' do
      expect(page).to have_content 'John Doe: Nice photo!'
    end
  end

end

feature 'On the movie page' do
  context 'while logged in' do

    before(:each) do
      create_visit
      m = Movie.first
      visit "/movies/#{m.id}"
    end

    scenario 'can comment on other users photo', js: true do
      click_button 'Comment'
      fill_in 'comment_remark', with: 'Nice photo!'
      expect { click_button 'Submit' }.to change { Comment.count }.by 1
      expect(page).to have_content 'John Doe: Nice photo!'
    end
  end

  context 'while logged out' do

    before(:each) do
      create_visit
      p = Photo.first
      u = User.first
      m = Movie.first
      Comment.create(remark: 'Nice photo!', photo_id: p.id, user_id: u.id)
      click_link 'Sign out'
      visit "/movies/#{m.id}"
    end

    scenario 'is not allowed to comment' do
      expect(page).not_to have_content 'Comment'
    end
    scenario 'can see comments already created' do
      expect(page).to have_content 'John Doe: Nice photo!'
    end
  end

end

feature 'On the location page' do
  context 'while logged in' do

    before(:each) do
      create_visit
      l = Location.first
      visit "/locations/#{l.id}"
    end

    scenario 'can comment on other users photo', js: true do
      click_button 'Comment'
      fill_in 'comment_remark', with: 'Nice photo!'
      expect { click_button 'Submit' }.to change { Comment.count }.by 1
      expect(page).to have_content 'John Doe: Nice photo!'
    end
  end

  context 'while logged out' do

    before(:each) do
      create_visit
      p = Photo.first
      u = User.first
      l = Location.first
      Comment.create(remark: 'Nice photo!', photo_id: p.id, user_id: u.id)
      click_link 'Sign out'
      visit "/locations/#{l.id}"
    end

    scenario 'is not allowed to comment' do
      expect(page).not_to have_content 'Comment'
    end
    scenario 'can see comments already created' do
      expect(page).to have_content 'John Doe: Nice photo!'
    end
  end

end