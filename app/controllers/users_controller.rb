class UsersController < ApplicationController



#deviseエラー回避用に作成
  def index
    redirect_to  new_user_registration_path
  end

  def telephone
  end

  def address
  end

  def login_payment 
  end


  def show
  end

  def show_todo
  end

  def like_list

  end

  def under_exhibition
  end

  def during_trading
  end

  def sold_list
  end

  def profile
    @user = User.new
  end
  
  def logout_page
  end

  def payment
  end

  def show_notice
  end

  def personal_information
  end

end
