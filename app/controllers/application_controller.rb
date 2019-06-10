class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resouce)
    root_path
  end 
end
