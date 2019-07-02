
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
crumb :item do |i|
  link i.name,item_path
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
crumb :show_todo do
  link "やることリスト","/users/:id/show_todo"
  parent :user
end

# user#like_list
crumb :like_list do
  link "いいね一覧","/users/:id/like_list"
  parent :user
end

# item#under_exhibition
crumb :under_exhibition do
  link "出品中","/items/:id/under_exhibition"
  parent :user
end

# user#during_trading
crumb :during_trading do
  link "取引中","/users/:id/during_trading"
  parent :user
end

# user#sold_list
crumb :sold_list do
  link "売却済","/users/:id/sold_list"
  parent :user
end

# user#profile
crumb :profile do
  link "プロフィール","/users/:id/profile"
  parent :user
end

# user#personal_information
crumb :personal_information do
  link "ログアウト","/users/:id/personal_information"
  parent :user
end

# user#payment_page
crumb :payment_page do
  link "支払い方法","/users/:id/payment_page"
  parent :user
end


# user#personal_information
crumb :personal_information do
  link "本人情報","/users/:id/personal_information"
  parent :user
end

# user#logout_page
crumb :logout_page do
  link "ログアウト","/users/:id/logout_page"
  parent :user
end

# category#index
crumb :category do
  link "カテゴリー一覧",categorys_path
  parent :root
end


