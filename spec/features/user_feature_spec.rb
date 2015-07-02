require 'rails_helper'

feature 'A user wants to view another user\'s profile page' do

  before(:all) do
    set_omniauth
    visit '/'
    click_link 'Sign in with Facebook'
    visit '/users/1'
  end

  context 'viewing page' do
    scenario 'displays user name' do
      expect(page).to have_content 'User page of John Doe'

    end

    scenario 'displays user image' do
      set_omniauth
      visit '/'
      click_link 'Sign in with Facebook'
      visit '/users/1'
      expect(page).to have_css('img#userProfile')
    end


  end
end
