class PurchasesController < ApplicationController

  require 'payjp'
  before_action :set_item,only:[:index, :pay]

  def index
    @address = current_user.address
    card = current_user.cards.first
    #テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to  signup_credit_new_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = current_user.cards.first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
    )
     @item.update(status: 1)
     @item.update(customer_id: current_user.id)
     redirect_to ( done_items_purchase_index_path) #完了画面に移動
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
