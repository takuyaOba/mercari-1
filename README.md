
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
