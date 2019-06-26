module FlagsHelper

  def flag_judgment
    #current_userの部分を仮で7としています
    if Flag.find_by(user_id: 7,item_id: @item.id)
      p "報告済"
    else
      link_to "送信する","/flags/#{@item.id}/create",method: :post,class:"flag-main__main__flags-select__buttom"
    end
  end


end
