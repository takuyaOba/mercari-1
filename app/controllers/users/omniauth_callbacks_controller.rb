# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # callback for facebook
  def facebook
    callback_for(:facebook)
  end

  # callback for google
  def google_oauth2
    callback_for(:google)
  end

  # common callback method
  def callback_for(provider)
    provider = provider.to_s

    @user = User.find_for_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      session[:uid] = session["devise.#{provider}_data"][:uid]
      session[:provider] = session["devise.#{provider}_data"][:provider]
      session[:facebook_email] = session["devise.#{provider}_data"][:info][:email]
      session[:name] = session["devise.#{provider}_data"][:info][:name]
      redirect_to signup_registration_path controller: 'registration', action: 'new'
    end
  end

  def failure
    redirect_to root_path
  end

end
