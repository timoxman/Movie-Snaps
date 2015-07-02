require 'rails_helper'

feature 'A user wants to view another user\'s profile page' do

  before do
    set_omniauth
    visit '/'
  end

  context 'viewing page' do
    scenario 'displays user name' do
      click_link 'Sign in with Facebook'
      visit '/users/1'
      expect(page).to have_content 'User page of John Doe'
    end
  end
end