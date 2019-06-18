class ItemsController < ApplicationController

   before_action :find_params, only:[:show,:destroy,:edit]

   rescue_from ActiveRecord::RecordInvalid do |exception|
    redirect_to :root, alert: 'エラーが発生しました'
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def create
    item = Item.create(item_params)
    redirect_to :index
  end

  def show
  end

  def edit
  end

  def update
    item = Item.update(params_create)
    move_index
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      flash[:notice] = "商品を削除しました"
      redirect_to root_path(current_user.id)
    else
      flash[:notice] = "削除に失敗しました"
      redirect_to root_path(current_user.id)
    end
  end

  def exhibition_edit
  end

  def order_confirm
  end

end

private

def item_params
  params.require(:item).permit(:name, :description, :price, :condition, :delivery_burden_id, :delivery_way_id, :delivery_days_id, :prefecture_id, images_attributes: [:image]).merge(user_id: current_user.id)
end

def move_index
  redirect_to action: :index
end

def find_params
  
end
