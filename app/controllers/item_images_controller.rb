class ItemImagesController < ApplicationController

  before_action :find, only:[ :index]

  def index
    if @item_image.present?
      @item_image.delete
    else
      redirect_to controller: 'items', action: 'under_exhibition'
    end
  end

  def find
    @item_image = ItemImage.find(params[:id])
  end
end
