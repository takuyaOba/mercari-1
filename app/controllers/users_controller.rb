class UsersController < ApplicationController



  def index 
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
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :family_name, :first_name, :family_kana, :first_kana, :avatar, :profile, :birth_year, :birth_month, :birth_day, :telephone, :prefecture_id)
  end
end