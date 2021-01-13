## Users

|Column             |Type    |Options    |
|-------------------|--------|-----------|
|email              |string  |null: false|
|encrypted_password |string  |null: false|
|last_name          |string  |null: false|
|first_name         |string  |null: false|
|last_name_kana     |string  |null: false|
|first_name_kana    |string  |null: false|
|birth_day          |integer |null: false|

### Association
--has_many :items
--has_many :orders

## Items
|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|item_name         |string     |null: false                   |
|description       |text       |null: false                   |
|price             |integer    |null: false                   |
|user              |references |null: false, foreign_key: true|
|category_id       |integer    |null: false                   |
|condition_id      |integer    |null: false                   |
|shipping_payer_id |integer    |null: false                   |
|shipping_date_id  |integer    |null: false                   |
|prefecture_id     |integer    |null: false                   |

### Association
--belongs_to :user
--has_one    :order

## Orders

|Column      |Type       |Options                       |
|------------|-----------|------------------------------|
|user_id     |references |null: false, foreign_key: true|
|item_id     |references |null: false, foreign_key: true|

### Association
--belongs_to :user
--belongs_to :item

## Shipping_addresses
|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|zip_code          |integer    |null: false                   |
|city              |string     |null: false                   |
|street_name       |string     |null: false                   |
|building_name     |string     |       ------------           |
|phone_number      |integer    |null: false                   |
|prefecture_id     |integer    |null: false                   |
|order_id          |references |null: false, foreign_key: true|

### Association
--has_one    :order

