# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| last_name_kana        | string  | null: false |
| birth_date            | date    | null: false |

### Association

- has_many :items
- has_many :item_purchases


## items テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| user_id             | integer | null: false, foreign_key: true |
| name                | string  | null: false                    |
| info                | text    | null: false                    |
| category            | integer | null: false                    |
| sales_status        | integer | null: false                    |
| shipping_fee_status | integer | null: false                    |
| prefecture          | integer | null: false                    |
| scheduled_delivery  | integer | null: false                    |
| price               | integer | null: false                    |

### Association

- belongs_to :user
- has_one :item_purchase


## item_purchases テーブル

| Column  | Type    | Options                       |
| ------- | ------- | ----------------------------- |
| user_id | integer | null: false, foreign_key:true |
| item_id | integer | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addresses テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postal_code   | string      | null: false                    |
| prefecture    | integer     | null: false                    |
| city          | string      | null: false                    |
| addresses     | string      | null: false                    |
| building      | string      |                                |
| phone_number  | string      | null: false                    |
| item_purchase | references  | null: false, foreign_key: true |

### Association

- belongs_to :item_purchase


