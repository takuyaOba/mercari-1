class ItemsController < ApplicationController


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

  def create
    @item = Item.new(item_params)
    if @item.save
      move_index
    else
      redirect_to new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @images = @item.item_images
    # binding.pry
    # @item_image = @item.item_images.find_by(item_id: @item.id)
    # @new_images = @item.item_images.new
    # @item_image = ItemImage.where(item_id: params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    # @image = @item.item_images
    # @image.update(params[:image].to_h)
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

  def under_exhibition
    @items = Item.where(user_id: current_user.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :condition_id, :delivery_burden_id, :delivery_way_id, :delivery_days_id, :prefecture_id,  :first_category_id, :second_category_id, :third_category_id, item_images_attributes: [:image]).merge(status: 1, user_id: current_user.id)
  end

  def move_index
    redirect_to action: :index
  end
end