class ItemImagesController < ApplicationController

  before_action :find, only:[ :index]

  def index
    if @item_image.delete
      respond_to do |format|
        format.html
        format.json
      end
    else
      redirect_to controller: 'items', action: 'under_exhibition', alert: '削除に失敗しました'
    end
  end

  def find
    @item_image = ItemImage.find(params[:id])
  end
end
