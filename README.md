|email           |string  |null: false|
|password        |string  |null: false|
|last_name       |string  |null: false|
|first_name      |string  |null: false|
|last_name_kana  |string  |null: false|
|first_name_kana |string  |null: false|
|birth_year      |integer |null: false|
|birth_month     |integer |null: false|
|birth_date      |integer |null: false|

### Association
--has_many :items
--has_many :orders

## Items

|Column            |Type       |Options                       |
|item_name         |string     |null: false                   |
|description       |text       |null: false                   |
|price             |string     |null: false                   |
|image             |           |null: false                   |
|user_id           |references |null: false, foreign_key: true|
|category_id       |references |null: false, foreign_key: true|
|condition_id      |references |null: false, foreign_key: true|
|shipping_payer_id |references |null: false, foreign_key: true|
|shipping_date_id  |references |null: false, foreign_key: true|
|prefecture_id     |references |null: false, foreign_key: true|

### Association
--belongs_to :user
--has_one    :order
--belongs_to :category
--belongs_to :condition
--belongs_to :shipping_payer
--belongs_to :shipping_date
--belongs_to :prefecture

## Orders

|user_id     |references |null: false, foreign_key: true|
|item_id     |references |null: false, foreign_key: true|
|credit_card |pay.jp     |----------------------------  |

### Association
--belongs_to :user
--has_one    :item

## Shipping_addresses

|Column            |Type       |Options                       |
|zip_code          |integer    |null: false                   |
|city              |string     |null: false                   |
|street_name       |string     |null: false                   |
|building_name     |string     |       ------------           |
|phone_number      |integer    |null: false                   |
|prefecture_id     |references |null: false, foreign_key: true|
|order_id          |references |null: false, foreign_key: true|

### Association
--belongs_to :prefecture
--has_one    :order

## Prefectures

|Column            |Type    |Options    |
|prefecture        |string  |null: false|
 
 ### Association
--has_many :shipping_addresses
--has_many :items

## Categories

|Column            |Type    |Options    |
|category          |string  |null: false|
 
 ### Association
--has_many :items

## Conditions

|Column            |Type    |Options    |
|condition         |string  |null: false|
 
 ### Association
--has_many :items

## Shipping_payers

|Column            |Type    |Options    |
|shipping_payer    |string  |null: false|
 
 ### Association
--has_many :items

## Shipping_dates

|Column            |Type    |Options    |
|shipping_date     |string  |null: false|
 
 ### Association
--has_many :items
