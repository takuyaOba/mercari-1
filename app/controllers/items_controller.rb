class ItemsController < ApplicationController
   before_action :find_params, only:[:show,:destroy,:edit]

    def index
      @items = Item.all
    end

    def new
      @item = Item.new
    end

    def create
      begin
        @item = Item.create(params_create)
        move_index
        rescue ActiveRecord::RecordInvalid => e
        @item = e.record
        render :action => 'new'
      end
    end

    def show
    end

    def edit
      render 'new'
    end

    def update
        begin
         @item = Item.update(params_create)
          move_index
          rescue ActiveRecord::RecordInvalid => e
          @item = e.record
          render :action => 'new'
        end
    end

    def destroy
        begin
        @item = find_params.delete
        move_index   
        rescue ActiveRecord::RecordInvalid => e
        @item = e.record
        render :action => 'new'
        end
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