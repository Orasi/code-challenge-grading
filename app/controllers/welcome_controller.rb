require 'ruby-saml'
class WelcomeController < ApplicationController
  before_action :require_login, only: :index

  def saml_settings
    settings = OneLogin::RubySaml::Settings.new

    settings.assertion_consumer_service_url = "https://codechallenge.orasi.com/auth/saml/callback"
    settings.issuer                         = 'https://codechallenge.orasi.com'
    settings.idp_sso_target_url             = "https://adfs.orasi.com/adfs/ls/"
    settings.idp_cert_fingerprint           = "DF:36:3E:72:B1:36:D8:8E:32:55:41:B8:92:39:A9:03:7C:08:8F:88"

    settings
  end
  
  def login
    if Rails.env.production?
      request = OneLogin::RubySaml::Authrequest.new
      redirect_to(request.create(saml_settings))
      return
    end
  end

  def validate_login
    #Get their picture.
    response          = OneLogin::RubySaml::Response.new(params[:SAMLResponse])
    response.settings = saml_settings

    user = User.find_or_create(response)
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
