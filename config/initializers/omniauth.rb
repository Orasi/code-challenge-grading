Rails.application.config.middleware.use OmniAuth::Builder do

  provider :wsfed,
    :issuer_name           => "http://adfs.orasi.com",
    :issuer                => "https://adfs.orasi.com/adfs/ls/",
    :realm                 => "http://codechallenge.orasi.com",
    :reply                 => "http://codechallenge.orasi.com/login",
    :id_claim              => "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name", 
    :id_cert               => "MIIC2DCCAcCgAwIBAgIQcoBCRF+gq5JPRZmjB2NmCDANBgkqhkiG9w0BAQsFADAoMSYwJAYDVQQDEx1BREZTIFNpZ25pbmcgLSBhZGZzLm9yYXNpLmNvbTAeFw0xNDAxMjAxNDQ2MDNaFw0xNTAxMjAxNDQ2MDNaMCgxJjAkBgNVBAMTHUFERlMgU2lnbmluZyAtIGFkZnMub3Jhc2kuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAptxZv/24Y//FugbIYto8BZXIXQZU2fw+2kG+gWJJ7DbzqR5XgZZkF7JBEQFvcFPt4+h3uF7cA5NH1pxffCTDW5svaJHQn+thg95pg0m+vMxIudCNiHt+9x4jZZ/2eeXUJm8+c06IwasZiTNi14ULBVBUsO4pApDkCTEPrJtwDTUahdu9goLr4e3yaNkufhYu/hbdiVlVFVLeWqKqn62eexCcosWzpsN9A1Rm/9UzfBfOTq/nr1ektJGncTs+qRQSEbLXcV59PUfY6axJ2DKHB0hmbjNHXWpNybxkWPb8WnLzO218Yh08+ahGaX9IMXr9PaW+LznUIwW/2rOGV/DbmQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAtkLxjpW+gORYhAtJYMGOGa34/yNFu8KQ82IiopPgTu60SHkNjdx5ZIa67IZy2cZZouutMyMb3uOd4e/c6fVcfm4unRbkdKxXterMeNKAWeVZJ3BYA3OAmoUTm4al3PYzGv5wJUxruxiMe+A2/aheDduDldjNtbA43LtoVsetsHkIZb2QEPHbk4mCHDcmNK1k5uz0jnelacnH/lRtLO3nERzFdR1/mbiyccN1dO3TwVKKQESyHx/wTWHgN32BsF4WxhxpTXjIXg3YCivooxUT9w50NB4JVfmqk8ffG/HdukHbmYhBcfS4HypZC7ZJugA7n+ZGCiMmTIPoMXQshghhJ"

end
OmniAuth.config.logger = Rails.logger
