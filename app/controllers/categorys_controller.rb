class CategorysController < ApplicationController

  def index
    @lists = FirstCategory.all

    @tops = ThirdCategory.genre(1)
    @jackets = ThirdCategory.genre(2)
    @pants = ThirdCategory.genre(3)
    


  end

  def show
  end
end
