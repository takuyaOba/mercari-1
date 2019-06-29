module ItemsHelper

  # 検索結果にて表示の切り替え
  def search_judgment
    if  @item_search.present?
      "#{@items}の検索結果"
    else
      p "#{@items} 検索できませんでした"
    end
  end

  def search_count
    p "検索ヒット数 #{@item_search.count}" if @item_search.present?   
  end

end