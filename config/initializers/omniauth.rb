Rails.application.config.middleware.use OmniAuth::Builder do

  provider :wsfed,
    :issuer_name           => "http://adfs.orasi.com",
    :issuer                => "https://adfs.orasi.com/adfs/ls/",
    :realm                 => "http://codechallenge.orasi.com",
    :reply                 => "http://codechallenge.orasi.com/login",
    :id_claim              => "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name",
    :idp_cert_fingerprint  => "FC96D2983…"

end
