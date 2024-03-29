class UsersController < ApplicationController
  before_action :set_user,only:[:show,:show_notice,:show_todo,:like_list, :during_trading,:sold_list]


  def index 
  end
  
  def show
  end

  #お知らせリンク
  def show_notice
  end

  #やる事リスト
  def show_todo
  end
  #いいね！一覧
  def like_list
  end



  #出品した商品(取引中)
  def during_trading
  end

  #出品した商品(売却済)
  def sold_list
  end
  
  #出品した商品(売却済)
  def profile
    @user = User.new
  end
  
  def logout_page
  end

  def payment_page
   
    card = current_user.cards.first
    redirect_to new_card_path(current_user.id) if card.blank?
    Payjp.api_key  ="sk_test_09b735f6b6e6eb1497c08c82"
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)

  end

  def delete #PayjpとCardデータベースを削除します
    card = current_user.cards.first
    if card.present?
      Payjp.api_key  ="sk_test_09b735f6b6e6eb1497c08c82"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def personal_information
    @user = User.new
  end

  

  private
  def user_params
    params.require(:user).permit(:nickname, :family_name, :first_name, :family_kana, :first_kana, :avatar, :profile, :birth_year, :birth_month, :birth_day, :telephone, :prefecture_id, :city, :adress, :building, :zip_code, :point_amount, :profile_amount, :payment_information_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

end