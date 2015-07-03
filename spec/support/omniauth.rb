def set_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = {
    'provider'  => 'facebook',
    'uid'       => 12345,
    'info' => {
      'email' => 'email@email.com',
      'name'       => 'John Doe',
      'image'       => 'http://robohash.org/treemo'
      # any other attributes you want to stub out for testing
    }
  }
end
