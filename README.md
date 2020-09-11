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
| birth_date            | integer | null: false |

### Association

- has_many :orders
- has_many :items


## items テーブル

| Column                   | Type        | Options                        |
| ------------------------ | ----------- | ------------------------------ |
| user_id                  | references  | null: false, foreign_key: true |
| item_image               | string      | null: false                    |
| item_name                | string      | null: false                    |
| item_info                | text        | null: false                    |
| item_category            | string      | null: false                    |
| item_sales_status        | string      | null: false                    |
| item_shipping_fee_status | string      | null: false                    |
| item_prefecture          | string      | null: false                    |
| item_scheduled_delivery  | string      | null: false                    |
| item_price               | integer     | null: false                    |

### Association

- has_one :order
- belongs_to :user


## orders テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| user_id        | references  | null: false, foreign_key: true |
| item_id        | references  | null: false, foreign_key: true |
| card_number    | integer     | null: false                    |
| card_exp_month | integer     | null: false                    |
| card_exp_year  | integer     | null: false                    |
| card_cvc       | integer     | null: false                    |
| postal_code    | integer     | null: false                    |
| prefecture     | string      | null: false                    |
| city           | string      | null: false                    |
| addresses      | string      | null: false                    |
| building       | string      |                                |
| phone_number   | integer     |                                |

### Association

- belongs_to :item
- belongs_to :user
