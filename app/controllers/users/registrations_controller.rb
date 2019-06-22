class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # prepend_before_action :check_captcha, only: [:create]
  prepend_before_action :customize_sign_up_params, only: [:address]

  def new
  end


  def address
    session[:nickname] = params[:session][:nickname]
    session[:email] = params[:session][:email]
    session[:password] = params[:session][:password]
    session[:password_confirmation] = params[:session][:password_confirmation]
    session[:family_name] = params[:session][:family_name]
    session[:first_name] = params[:session][:first_name]
    session[:family_kana] = params[:session][:family_kana]
    session[:first_kana] = params[:session][:first_kana]
    session[:birth_day] = params[:session][:birth_day]
    session[:birth_month] = params[:session][:birth_month]
    session[:birth_year] = params[:session][:birth_year]

  end

  def credit
    session[:zip_code] = params[:session][:zip_code]
    session[:prefecture] = params[:session][:prefecture]
    session[:city] = params[:session][:city]
    session[:address] = params[:session][:address]
    session[:building] = params[:session][:building]
    session[:telephone] = params[:session][:telephone]

  # end

  # def create
    # token = params[:"payjp-token"]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_kana: session[:family_kana],
      first_kana: session[:first_kana],
      birth_day: session[:birth_day],
      birth_month: session[:birth_month],
      birth_year: session[:birth_year]
    )
    @user.save

    @user.address = @user.build_address(
      zip_code: session[:zip_code],
      city: session[:city],
      address: session[:address],
      building: session[:building],
      telephone: session[:telephone]
    )
    # @user.credit = @user.build_credit(
    #   token: token
    # )

    @user.address.save
    # @user.credit.save

    if session[:user_id] = @user.id
      sign_up(@user, current_user)
      redirect_to action: 'done'
    else
      redirect_to action: 'new'
    end
  end

  def done; end





  private
  def customize_sign_up_params
    devise_parameter_sanitizer.permit :sign_up, keys: %i[nickname email password password_confirmation family_name first_name family_kana first_kana birth_day birth_month birth_year city address building zip_code telephone]
  end

  # def check_captcha
  #   self.resource = resource_class.new sign_up_params
  #   resource.validate
  #   unless verify_recaptcha(model: resource)
  #     respond_with_navigational(resource) { render :new }
  #   end
  # end

end
