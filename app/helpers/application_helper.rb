module ApplicationHelper

  def like_judgment
    # current_userの代わりに8を入れています
    if Like.find_by(user_id: 8,item_id: @item.id)
      @item.likes.count
    else
      link_to @item.likes.count,"/likes/#{@item.id}/create",method: :post
    end
  end

  def flag_list
    # current_userの代わりに8を入れています
    if Flag.find_by(user_id: 1,item_id: @item.id)
      p "報告済み"
    else
      link_to "不適切な商品を報告", " /flags/#{@item.id}/new"
    end
  end
end

