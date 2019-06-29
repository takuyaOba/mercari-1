module FlagsHelper

  def flag_judgment
    if Flag.find_by(user_id:current_user&.id,item_id: @item.id)
      p "報告済"
    else
      link_to "送信する","/flags/#{@item.id}/create",method: :post,class:"flag-main__main__flags-select__buttom"
    end
  end


end
