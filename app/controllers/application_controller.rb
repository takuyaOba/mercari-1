class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  def after_sign_out_path_for(resouce)
    root_path
  end 

  protected
  
    def configure_permitted_parameters
    
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_kana, :first_kana, :birth_year, :birth_month, :birth_day])
    end
    
  

  
  end
  
end 