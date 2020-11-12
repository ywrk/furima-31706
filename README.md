# テーブル設計

## usersテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | NOT NULL    |
| email            | string | NOT NULL    |
| password         | string | NOT NULL    |
| first_name       | string | NOT NULL    |
| last_name        | string | NOT NULL    |
| first_name_kana  | string | NOT NULL    |
| last_name_kana   | string | NOT NULL    |
| birthday         | string | NOT NULL    |

### Association
- has_many :items
- has_one :order

## itemsテーブル
       
| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| title              | string      | NOT NULL                        |
| seller_name        | string      | NOT NULL                        |
| category           | string      | NOT NULL                        |
| status             | text        | NOT NULL                        |
| delivery_fee       | string      | NOT NULL                        |
| delivery_source    | string      | NOT NULL                        |
| estimated_delivery | string      | NOT NULL                        |
| user               | reference   | null: false, foreign_key: true  |
| image              |             |                                 |ActiveStorageで実装

### Association

- belongs_to :user
- has_one :order


## ordersテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| card_number        | string      | NOT NULL                        |
| expiration_date    | string      | NOT NULL                        |
| security_code      | string      | NOT NULL                        |
| post_code          | string      | NOT NULL                        |
| prefecture         | string      | NOT NULL                        |
| city               | string      | NOT NULL                        |
| address            | string      | NOT NULL                        |
| building_name      | string      |                                 |
| phone_number       | string      | NOT NULL                        |
| user               | reference   | null: false, foreign_key: true  |
| item               | reference   | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
