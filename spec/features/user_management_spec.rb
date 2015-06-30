feature 'User is on the home page' do

  before(:each) do
    OmniAuth.config.mock_auth[:facebook] = nil
  end

  xscenario 'and wants to sign in with Facebook' do
    visit '/'
    click_link 'Sign in with Facebook'
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'Sign out'
    expect(page).not_to have_content 'Sign in with Facebook'
  end

  xscenario 'has signed in and wants to sign back out' do
    visit '/'
    click_link 'Sign in with Facebook'
    click_link 'Sign out'
    expect(page).not_to have_content 'Welcome'
    expect(page).not_to have_content 'Sign out'
    expect(page).to have_content 'Sign in with Facebook'
  end
end