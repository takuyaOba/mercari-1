class CategorysController < ApplicationController
  def index
    @lists = FirstCategory.all
  end
  def show
  end
end
