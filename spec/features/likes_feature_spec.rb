require 'rails_helper'

feature 'A user on the homepage' do

  context 'while logged in' do

    before(:each) do
      create_visit
    end

    xscenario 'can like a photo', js: true do
      visit '/'
      click_link '♡'
      expect(page).to have_content '1 like'
      expect(Like.count).to eq 1
    end

    xscenario 'can only like a photo once', js: true do
      visit '/'
      click_link '♡'
      expect(page).not_to have_link '♡'
    end

  end

  context 'when logged out' do

    before(:each) do
      create_visit
      visit '/'
      click_link 'Sign out'
    end

    scenario 'cannot like a photo', js: true do
      expect(page).not_to have_link 'Like'
    end

  end

end