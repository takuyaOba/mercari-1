class ItemImagesController < ApplicationController
  def index
    @item_image = ItemImage.find(params[:id])
    if @item_image.delete
      respond_to do |format|
        format.html
        format.json
      end
    else
      redirect_to controller: 'items', action: 'under_exhibition', alert: '削除に失敗しました'
    end
  end
end
