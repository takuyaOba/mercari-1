class ItemImagesController < ApplicationController
  def index
    @item_image = ItemImage.find(params[:id])
    if @item_image.delete
      respond_to do |format|
        format.html
        format.json
    end
  end
end
