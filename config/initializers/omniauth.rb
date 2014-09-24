Rails.application.config.middleware.use OmniAuth::Builder do

  provider :wsfed,
    :issuer_name           => "http://adfs.orasi.com",
    :issuer                => "https://adfs.orasi.com/adfs/ls/",
    :realm                 => "http://codechallenge.orasi.com",
    :reply                 => "http://codechallenge.orasi.com/login",
    :idp_cert_fingerprint  => "FC96D2983…"

end
