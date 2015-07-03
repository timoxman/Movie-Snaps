require 'rails_helper'

feature 'User is on the home page' do
  context 'user is signed in and on the homepage' do
    before do
      set_omniauth
      visit '/'
    end

    scenario 'and wants to sign in with Facebook' do
      click_link 'Sign in with Facebook'
      expect(page).to have_content 'Welcome'
      expect(page).to have_content 'Sign out'
      expect(page).not_to have_content 'Sign in with Facebook'
      p User.all
    end

    scenario 'has signed in and wants to sign back out' do
      click_link 'Sign in with Facebook'
      click_link 'Sign out'
      expect(page).not_to have_content 'Sign out'
      expect(page).to have_content 'Sign in with Facebook'
    end
  end
end