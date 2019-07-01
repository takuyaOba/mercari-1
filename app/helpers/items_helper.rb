module ItemsHelper

  # 検索結果にて表示の切り替え
  def search_judgment
    if  @item_search.present?
      "#{@items} 検索結果"
    else
      p "#{@items} 検索できませんでした"
    end
  end

  def search_count
    p "#{@item_search.count}件表示" if @item_search.present?
  end

end