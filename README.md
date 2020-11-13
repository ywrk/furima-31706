# テーブル設計

## usersテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| nickname           | string      | NOT NULL                        |
| email              | string      | NOT NULL                        |
| encrypted_password | string      | NOT NULL                        |
| first_name         | string      | NOT NULL                        |
| last_name          | string      | NOT NULL                        |
| first_name_kana    | string      | NOT NULL                        |
| last_name_kana     | string      | NOT NULL                        |
| birthday           | date        | NOT NULL                        |

### Association
- has_many :items
- has_many :purchases
<!-- 1人のユーザーが商品を複数回購入可能なため -->


## itemsテーブル
       
| Column                | Type        | Options                         |
| --------------------- | ----------- | ------------------------------- |
| title                 | string      | NOT NULL                        |
| price                 | integer     | NOT NULL                        |
| description           | text        | NOT NULL                        |
| category_id           | integer     | NOT NULL                        |
| condition_id          | integer     | NOT NULL                        |
| shipping_from_id      | integer     | NOT NULL                        |
| shipping_fee_id       | integer     | NOT NULL                        |
| estimated_shipping_id | integer     | NOT NULL                        |
| user                  | reference   | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :purchase


## addressesテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| post_code          | string      | NOT NULL                        |
| prefecture_id      | integer     | NOT NULL                        |
| city               | string      | NOT NULL                        |
| address            | string      | NOT NULL                        |
| building_name      | string      |                                 |
| phone_number       | string      | NOT NULL                        |
| purchase           | reference   | null: false, foreign_key: true  |

### Association
- belongs_to :purchase



## purchasesテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| user               | reference   | null: false, foreign_key: true  |
| item               | reference   | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address