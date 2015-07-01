require 'rails_helper'

feature 'User is on the home page' do

  background do
    visit '/'
    set_omniauth()
    click_link_or_button 'Sign in with Facebook'
  end

  scenario 'and wants to sign in with Facebook', js: true do
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'Sign out'
    expect(page).not_to have_content 'Sign in with Facebook'
  end

  scenario 'has signed in and wants to sign back out', js: true do
    expect(page).not_to have_content 'Welcome'
    expect(page).not_to have_content 'Sign out'
    expect(page).to have_content 'Sign in with Facebook'
  end
end