class ItemImagesController < ApplicationController
  def index
    @item_image = ItemImage.find(params[:id])
    @item_image.delete
  end
end
