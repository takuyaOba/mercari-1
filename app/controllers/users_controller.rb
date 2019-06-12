class UsersController < ApplicationController



#deviseエラー回避用に作成
  def index
    redirect_to  new_user_registration_path
  end

  def show
  end

  def show_todo
  end

  def like_list

  end

end
