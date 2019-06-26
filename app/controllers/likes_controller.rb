class LikesController < ApplicationController
  
  def create
    #current_userの代わりに代替えのidを入れています
    like = Like.new(user_id: 8,item_id: params[:item_id])
    like.save
    redirect_to item_path(params[:item_id])
  end

  def destroy
    # current_userの代わりに8を入れています
    like = Like.find_by(user_id:8,item_id: params[:item_id])
    like.destroy
  end
end