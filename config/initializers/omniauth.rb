Rails.application.config.middleware.use OmniAuth::Builder do

  provider :wsfed,
    :issuer_name           => "http://adfs.orasi.com",
    :issuer                => "https://adfs.orasi.com/adfs/ls/",
    :realm                 => "https://codechallenge.orasi.com",
    :reply                 => "https://codechallenge.orasi.com/auth/wsfed/callback",
    :id_claim              => "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name", 
    :idp_cert_fingerprint  => "59:DD:95:8C:E3:70:AA:AB:00:57:11:95:24:9B:68:68:AC:C1:EF:CD"
end
OmniAuth.config.logger = Rails.logger
