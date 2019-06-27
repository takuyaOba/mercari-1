
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
  link item.name,item,item_path(item)
  parent :items
end

 # item#edit
crumb :edit_item do |item|
  link "Edit #{item.name}", edit_item_path(item)
  parent :show_item, item
end

 # item#new
crumb :new_item do
  link "商品出品ページ", new_item_path
  parent :items
end

# user#show
crumb :user do |user|
  link "マイページ",user,item_path(user)
  parent :root
end




