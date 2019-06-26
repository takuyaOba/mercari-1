class FlagsController < ApplicationController


  def new
    @flag = Flag.new
    @item = Item.find(params[:item_id])
   
  end

  def create
    #current_userの代わりに代替えのidを入れています
    flag = Flag.new(user_id: 8,item_id: params[:item_id])
    flag.save
    redirect_to item_path(params[:item_id])
  end

end

