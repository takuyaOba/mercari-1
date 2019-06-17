
# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,unique: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_kana|string| null :false|
|first_kana|string|null :false|
|avatar|string||
|profile|text||
|birth_year|integer|null :false|
|birth_month|integer|null :false|
|birth_day|integer|null :false|
|telephone|string|null :false unique: true|
|prefecture|string|null: false|
### Association
- has_many :items
- has_many :orders
- has_many :likes
- has_many :flags
- has_many :like_items,through::likes,source::item
- has_many :flag_items,through::flags,source::item
- belongs_to :rate
- belongs_to :payment_information
- belongs_to_active_hash :prefecture

# ratesテーブル
|Column|Type|Options|
|------|----|-------|
|rating|string||
### Association
- has_many :items
- has_many :users


# likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|item_id|reference|foreign_key: true|
### Association
- belongs_to :item,dependent: :destroy
- belongs_to :user,dependent: :destroy

# flagsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|item_id|reference|foreign_key: true|
### Association
- belongs_to :item,dependent: :destroy
- belongs_to :user,dependent: :destroy

# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false,foreign_key:ture|
|name|string|null:false|
|price |integer|null:false|
|description|text|null:false|
|first_category_id|reference|foreign_key:true|
|second_category_id|reference|foreign_key:true|
|third_category_id|reference|foreign_key:true|
|brand_id|reference|foreign_key:true|
|size_id|reference|foreign_key:true|
|status|iteger|null:false|
|condition|string|null:false|
|delivery_burden|string|null:false|
|delivery_way|string|null:false|
|prefecure|string|null:false|
|delivery_days|string|null:false|


### Association
- has_many :item_images
- has_many :likes
- has_many :flags
- has_many :like_users,through::likes,source::user
- has_many :flag_users,through::flags,source::user
- belongs_to :order
- belongs_to :user,dependent: :destroy
- belongs_to :first_category
- belongs_to :second_category
- belongs_to :third_category
- belongs_to :brand
- belongs_to :size
- belongs_to :rate,dependent: :destroy
- belongs_to_active_hash :condition
- belongs_to_active_hash :burden
- belongs_to_active_hash :way
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :days

# item_imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|item_id|reference|null:false,foreign_key:true|

### Association
belongs_to :item

# ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false,foreign_key:ture|
|item_id|reference|null:false,foreign_key:ture|
|first_name_delivery|string	null:false|
|first_name_kana_delivery|string|null:false|
|last_name_delivery|string|null:false|
|last_name_kana_delivery|string	null:false|
|city_delivery|string|null:false|
|adress_delivery|string|null:false|
|building_delivery|string|	
|zip_code_delivery|string|null:false|
|telephone_delivery|integer|	
|payment_method|integer|
### Association
- belongs_to :user,dependent: :destroy
- belongs_to :item,dependent: :destroy

# fisrt_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|first_category|string|null:false|  
### Association
- has_many :items
- has_many :brands,through::brand_categories
- has_many :brand_categories
- has_many :second_categories

# second_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|first_category_id|reference|foreign_key:ture|
|size_category_id|reference|foreign_key:ture|
|second_category|string|null:false|
|item_id|reference|foreign_key:true|
### Association
- belongs_to :first_category
- belongs_to :size_category
- belong_to  :item
- has_many :third_categories
- has_many :users

# third_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|second_category_id|reference|foreign_key:ture|
|third_category|string|null:false|
|item_id|reference|foreign_key:true|
### Association
- belongs_to :second_category
- belongs_to :item


# sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size_category_id|reference|foreign_key:ture|
|size|string|null:false|
### Association
- belongs_to :size_category
- has_many :items

# size_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|size_category|string|
### Association
- has_many :second_categories
- has_many :sizes

# brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|unique|
### Association
- has_many :items
- has_many :first_categories,through::brand_categories
- has_many :brand_categories

# brand_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|reference|foreign_key:ture|
|first_category_id|reference|foreign_key:ture|
### Association
- belongs_to :first_category
- belongs_to :brand


# payment_informationsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|	
|vaild_year|integer|	
|valid_month|integer|	
|cvc|integer|	
|user_id|reference|null:false,foreign_key:ture|
### Association
- belongs_to :user,dependent: :destroy