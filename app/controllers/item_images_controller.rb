class ItemImagesController < ApplicationController
  def index
    @item_image = ItemImage.find(params[:id])
    if @item_image.present?
      @item_image.delete
    else
      redirect_to edit_item_path
    end
  end
end
