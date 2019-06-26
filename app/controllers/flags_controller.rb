class FlagsController < ApplicationController


  def new
    @flag = Flag.new
    @item = Item.find(params[:item_id])
   
  end

  def create
    flag = Flag.new(user_id:current_user.id,item_id: params[:item_id])
    flag.save
    redirect_to item_path(params[:item_id])
  end

end

