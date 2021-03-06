## Users

|Column             |Type    |Options    |
|-------------------|--------|-----------|
|nickname           |string  |null: false|
|email              |string  |null: false|
|encrypted_password |string  |null: false|
|last_name          |string  |null: false|
|first_name         |string  |null: false|
|last_name_kana     |string  |null: false|
|first_name_kana    |string  |null: false|
|birthday           |date    |null: false|

### Association
--has_many :items
--has_many :orders
--has_many :comments

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
--has_many   :comments

## Orders

|Column      |Type       |Options                       |
|------------|-----------|------------------------------|
|user        |references |null: false, foreign_key: true|
|item        |references |null: false, foreign_key: true|

### Association
--belongs_to :user
--belongs_to :item
--has_one  :shipping_address

## Shipping_addresses
|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|zip_code          |string     |null: false                   |
|city              |string     |null: false                   |
|street_name       |string     |null: false                   |
|building_name     |string     |       ------------           |
|phone_number      |string     |null: false                   |
|prefecture_id     |integer    |null: false                   |
|order             |references |null: false, foreign_key: true|

### Association
--belongs_to    :order

## Comments

|Column         |Type       |Options                       |
|---------------|-----------|------------------------------|
|user           |references |null: false, foreign_key: true|
|item           |references |null: false, foreign_key: true|
|comment        |text       |null: false                   |

### Association
--belongs_to :user
--belongs_to :item
