# テーブル設計

## usersテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| nickname           | string      | null: false                     |
| email              | string      | null: false                     |
| encrypted_password | string      | null: false                     |
| first_name         | string      | null: false                     |
| last_name          | string      | null: false                     |
| first_name_kana    | string      | null: false                     |
| last_name_kana     | string      | null: false                     |
| birthday           | date        | null: false                     |

### Association
- has_many :items
- has_many :purchases
<!-- 1人のユーザーが商品を複数回購入可能なため -->


## itemsテーブル
       
| Column                | Type        | Options                         |
| --------------------- | ----------- | ------------------------------- |
| title                 | string      | null: false                     |
| price                 | integer     | null: false                     |
| description           | text        | null: false                     |
| category_id           | integer     | null: false                     |
| condition_id          | integer     | null: false                     |
| shipping_from_id      | integer     | null: false                     |
| shipping_fee_id       | integer     | null: false                     |
| estimated_shipping_id | integer     | null: false                     |
| user                  | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :purchase


## addressesテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| post_code          | string      | null: false                     |
| prefecture_id      | integer     | null: false                     |
| city               | string      | null: false                     |
| address            | string      | null: false                     |
| building_name      | string      |                                 |
| phone_number       | string      | null: false                     |
| purchase           | references  | null: false, foreign_key: true  |

### Association
- belongs_to :purchase



## purchasesテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| user               | references  | null: false, foreign_key: true  |
| item               | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address