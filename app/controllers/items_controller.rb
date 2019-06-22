class ItemsController < ApplicationController

   before_action :find_params, only:[:show,:destroy,:edit]
   rescue_from ActiveRecord::RecordInvalid do |exception|
    redirect_to :root, alert: 'エラーが発生しました'
  end

    def index
     @women = Item.display(1)
     @men = Item.display(2)
     @kids = Item.display(3)

    end

  def new
    @item = Item.new
    3.times{@item.item_images.build}
   
  end

  def create 
   
    item = Item.new(item_params)

    if item.save

      move_index
    else
      redirect_to new_item_path
    end

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    item = Item.update(params_create)
   
    move_index
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path(current_user.id)
      flash[:notice] = "商品を削除しました"
    else
      redirect_to root_path(current_user.id)
      flash[:notice] = "削除に失敗しました"
    end
  end

  def exhibition_edit
    
  end

  def order_confirm
  end

end

private



def item_params
  params.require(:item).permit(
    :status,:name,
    :description, :price,
    :delivery_burden_id,
    :delivery_way_id,
    :first_category_id,
    :delivery_days_id,:prefecture_id,
    # item_images_attributes:[:image]
    item_images_attributes:[:image]
  ).merge(status: 1)
end

def move_index
  redirect_to action: :index
end
