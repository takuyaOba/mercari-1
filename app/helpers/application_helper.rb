module ApplicationHelper

  # items/showいいねの表示部分

  def like_judgment
    if Like.find_by(user_id:current_user.id,item_id: @item.id)
      link_to @item.likes.count,"/likes/#{@item.id}/create",method: :delete
    else 
      link_to @item.likes.count,"/likes/#{@item.id}/create",method: :post
    end
  end

  # items/show不適切な商品を報告
  def flag_list
    if Flag.find_by(user_id:current_user.id,item_id: @item.id)
      p "報告済み"
    else
      link_to "不適切な商品を報告","/flags/#{@item.id}/new"
    end
  end
end

