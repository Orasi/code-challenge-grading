require 'ruby-saml'
class WelcomeController < ApplicationController
  before_action :require_login, only: :index

  def init
    request = OneLogin::RubySaml::Authrequest.new
    redirect_to(request.create(saml_settings))
  end  

  def consume
    response          = OneLogin::RubySaml::Response.new(params[:SAMLResponse])
    response.settings = saml_settings

    if response.is_valid? && user = current_account.users.find_by_email(response.name_id)
      authorize_success(user)
    else
      authorize_failure(user)
    end
  end

  def saml_settings
    settings = OneLogin::RubySaml::Settings.new

    settings.assertion_consumer_service_url = "http://#{request.host}/auth/saml"
    settings.issuer                         = request.host
    settings.idp_sso_target_url             = "https://adfs.orasi.com/adfs/ls/#{OneLoginAppId}"
    settings.idp_cert_fingerprint           = OneLoginAppCertFingerPrint
    settings.name_identifier_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  # Optional for most SAML IdPs
    settings.authn_context = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"

    settings
  end
  def login
    request = OneLogin::RubySaml::Authrequest.new
    redirect_to(request.create(saml_settings))
  end

  def validate_login
    #Get their picture.
  
    user = User.find_or_create(request.env['omniauth.auth'].uid)
=begin
    unless user.validate_against_ad(params[:user][:password])
      redirect_to :login, flash: {error: "Invalid username or password."}
      return
    end
=end
	
    if user.save
      user.touch
      session[:user_id] = user.id
    else
      flash[:error] = user.errors.full_messages.first
    end
    redirect_to :root
  end

  def logout
    session[:user_id] = nil
#    redirect_to :login, :error =>  "Logged Out"
    redirect_to logout_path
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
  def rules
	
  end
end
