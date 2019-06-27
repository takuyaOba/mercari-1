
# homeの設定
crumb :root do
  link "メルカリ", root_path
end

# item#index
crumb :items do
  link "商品一覧ページ",items_path
  parent :root
end


# item#show
crumb :item do |item|
  link item.name,item_path
  parent :items
end


 # item#new
crumb :new do
  link "商品出品ページ", new_item_path
  parent :items
end

# user#show
crumb :user do
  link "マイページ",item_path
  parent :root
end

# user#show_notice
crumb :show_notice do
  link "お知らせ","/users/:id/show_notice"
  parent :user
end

# user#show_todo
crumb :show_notice do
  link "やる事リスト","/users/:id/show_todo"
  parent :user
end

# user#like_list
crumb :show_notice do
  link "いいね一覧","/users/:id/like_list"
  parent :user
end



