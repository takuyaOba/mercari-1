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

  def create
    @image = ItemImage.new(image: params[:file])
    if @image.save
      render json: {message: "success", fileID: @image.id}, :status => 200
    else
      render json: { error: @image.errors.full_messages.join(',')}, :status => 400
    end
end
