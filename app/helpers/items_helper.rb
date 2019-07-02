module ItemsHelper

  # 検索結果にて表示の切り替え
  def search_judgment
    if  @item_search.present?
      "#{@items} 検索結果"
    else
      p "#{@items} 投稿された商品一覧を表示"
    end
  end

  def search_count
    p "#{@item_search.count}件表示" if @item_search.present?
  end


  #items#show ブラントとサイズの条件式

  def brand
    @item.brand.name if @item.brand.present?
  end

  def size
    @item.size.size if @item.size.present?
  end


end