
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
|telephone|integer|null :false unique: true|




### Association
-  has_many :users_groups

# usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
-  has_many :users_groups

# usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
-  has_many :users_groups

# usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
-  has_many :users_groups

# usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
-  has_many :users_groups

# usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
-  has_many :users_groups


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
- belongs_to :item
- belongs_to :user

# flagsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
item_id|reference|foreign_key: true|

###Association

- belongs_to :item
- belongs_to :user

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
|delivery_charge|reference|foreign_key:true|
|prefecure_id|reference|foreign_key:true|
|delivery_dates_id|reference|foreign_key:true|
|delivery_ways_id|reference|foreign_key:true|
|order_status_id|reference|foreign_key:true|

###Association

- has_many :item_images
- has_many :communications
- has_many :likes
- has_many :flags
- has_many :message_users,through::messages,source::user
- has_many :like_users,through::likes,source::user
- has_many :flag_users,through::flags,source::user
- belongs_to :order
- belongs_to :profit
- belongs_to :prefecture
- belongs_to :user
- belongs_to :first_category
- belongs_to :second_category
- belongs_to :third_category
- belongs_to :brand
- belongs_to :delivery_charge
- belongs_to :delivery_date
- belongs_to :order_status
- belongs_to :size
- belongs_to :delivery_way


# item_imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null:false|
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
|prefecture_id|reference|foreign_key: true|
|city_delivery|string|null:false|
|adress_delivery|string|null:false|
|building_delivery|string|	
|zip_code_delivery|integer|null:false|
|telephone_delivery|integer|	
|payment_method|integer|

### Association
- belongs_to :user
- belongs_to :item
- has_many :rate_counts

# fisrt_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
first_category	string	null:false
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

###Association

- belongs_to :first_category
- belongs_to :size_category
- has_many :third_categories
- has_many :users

#third_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|second_category_id|reference|foreign_key:ture|
|third_category|string|null:false|

###Association

- belongs_to :second_category
- has_many :users

#sizesテーブル

|Column|Type|Options|
|------|----|-------|
|size_category_id|reference|foreign_key:ture|
|size|string|null:false|

###Association

- belongs_to :size_category
- has_many :items

#size_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|size_category|string|

### Association

- has_many :second_categories
- has_many :sizes

#brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|string|unique|
|first_category_id|reference|foreign_key:ture|

###Association

- has_many :items
- has_many :first_categories,through::brand_categories
- has_many :brand_categories

#brand_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|brand_id|reference|foreign_key:ture|
|first_category_id|reference|foreign_key:ture|

### Association

- belongs_to :first_category
- belongs_to :brand



# delivery_chargesテーブル

|Column|Type|Options|
|------|----|-------|
|charge|string|

###Association

- has_many :items

# delivery_datesテーブル

|Column|Type|Options|
|------|----|-------|
|date|string|	

### Association

- has_many :items

# delivery_waysテーブル

|Column|Type|Options|
|------|----|-------|
|way|string|	

###Association
- has_many :items

# order_statusesテーブル

|Column|Type|Options|
|------|----|-------|
|order_status|string|	

###Association

-has_many :items
-has_many :communications

# payment_informationsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|	
|vaild_year|integer|	
|valid_month|integer|	
|cvc|integer|	
|user_id|reference|null:false,foreign_key:ture|

### Association

- belongs_to :user