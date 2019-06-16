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
    item = find_params.delete
    move_index   
  end
end

private

def item_params
  params.require(:item).permit(:name, :description, :price).merge(user_id: current_user.id)
end

def move_index
  redirect_to action: :index
end

def find_params
  
end
