=begin
Rails.application.config.middleware.use OmniAuth::Builder do

  provider :wsfed,
    :issuer_name           => "http://adfs.orasi.com",
    :issuer                => "https://adfs.orasi.com/adfs/ls/",
    :realm                 => "https://codechallenge.orasi.com",
    :reply                 => "https://codechallenge.orasi.com/auth/wsfed/callback",
    :id_claim              => "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name", 
   :idp_cert_fingerprint  => "DF:36:3E:72:B1:36:D8:8E:32:55:41:B8:92:39:A9:03:7C:08:8F:88"
end
=end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
    :assertion_consumer_service_url     => "https://codechallenge.orasi.com/auth/saml/callback",
    :issuer                             => "https://codechallenge.orasi.com",
    :idp_sso_target_url                 => "https://adfs.orasi.com/adfs/ls/",
    :idp_cert_fingerprint               => "DF:36:3E:72:B1:36:D8:8E:32:55:41:B8:92:39:A9:03:7C:08:8F:88"

end


OmniAuth.config.logger = Rails.logger
