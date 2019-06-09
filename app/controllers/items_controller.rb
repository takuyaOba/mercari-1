class ItemsController < ApplicationController

    def index
      @items = Item.all
    end

    def new
      @item = Item.new
    end

    def create
      item = Item.create(params_create)
      move_index
    end

    def show
      find_params
    end

    def edit
      item = find_params
      render 'new'
    end

    def update
      item = Item.update(params_create)
      move_index
    end

    def destroy
      find_params.delete
      move_index     
    end
end

private

def params_create
  params.require(:item).permit(:name)
end

def move_index
  redirect_to action: :index
end

def find_params
  @item = Item.find(params[:id])
end