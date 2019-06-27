class ItemsController < ApplicationController



   before_action :set_item,only:[:show]
   before_action :authenticate_user!, only: [:new]

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
    5.times{@item.item_images.build}
  end

  def show
 
    @item.likes
    # ユーザーが投稿した商品のうち、アイテム状態が１の商品のみをピック
    @exhibiton_items =  Item.where(user_id: @item.user_id, status: 1)
    
    # 評価を表示するロジックの実装
    rates     = Rate.where(user_id:@item.user_id)
    @good     = rates.where(value:1).count
    @usually  = rates.where(value:2).count
    @bad      = rates.where(value:3).count
  end

  def create
    item = Item.new(item_params)
    
    if item.save
      move_index
    else
      redirect_to new_item_path
    end
  end

  def second
    @second_categories = SecondCategory.where(first_category_id: params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def third
    @third_categories = ThirdCategory.where(second_category_id: params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @images = @item.item_images
  end

  def update
    if @item.update(item_params)
      move_index
    else
      redirect_to edit_item_path
    end
  end

  def destroy
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

  def under_exhibition
    @items = Item.where(user_id: current_user.id)
  end


  private
  def item_params
    params.require(:item).permit(:name,
    :description,
    :price,
    :condition_id,
    :delivery_burden_id,
    :delivery_way_id,
    :delivery_days_id,
    :prefecture_id,
    :first_category_id,
    :second_category_id,
    :third_category_id,
    item_images_attributes:[:image]).merge(status:0, user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_index
    redirect_to action: :index
  end
end