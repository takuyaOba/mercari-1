class UsersController < ApplicationController
  def show
  end

#deviseエラー回避用に作成
  def index
    redirect_to  new_user_registration_path
  end

end
