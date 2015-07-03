require 'rails_helper'

feature 'A user wants to view another user\'s profile page' do
  context 'viewing page' do
    scenario 'displays user name' do
      set_omniauth
      visit '/'
      click_link 'Sign in with Facebook'
      visit '/users/1'
      expect(page).to have_css('img#userProfile')
    end

    scenario 'displays user image' do
      set_omniauth
      visit '/'
      click_link 'Sign in with Facebook'
      visit '/users/1'
      expect(page).to have_css 'img#user_img'
    end
  end
end
