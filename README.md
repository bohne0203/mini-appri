# DB設計

##users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: :true|
|email|text|null: false, unique: true|

###Assosiation
- has_many blogs

##blogs table
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|image|string|------|
|user_id|integer|null: false, foreign_key: true|

###Assosiation
- belongs_to user

