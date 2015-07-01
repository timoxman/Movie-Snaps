def set_omniauth(opts = {})


  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = {
    'provider' => :facebook,
    'uid' => "1234",
    "info" => {
      "email" => "foobar@example.com"
      }
  }
end

def set_invalid_omniauth(opts = {})

  credentials = { :provider => :facebook,
                  :invalid  => :invalid_crendentials
                 }.merge(opts)

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

end