# テーブル設計

## users テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| nickname        | string     | null: false |
| email           | string     | null: false |
| password        | string     | null: false |
| first_name      | string     | null: false |
| last_name       | string     | null: false |
| first_name_kana | string     | null: false |
| last_name_kana  | string     | null: false |
| birthday        | select-box | null: false |

### Association

- has_many :items
- has_many :buys


## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| image          | image      | null: false                    |
| item_name      | text       | null: false                    |
| item_info      | text       | null: false                    |
| item_category  | select-box | null: false                    |
| item_condition | select-box | null: false                    |
| shipping_fee   | select-box | null: false                    |
| send_area      | select-box | null: false                    |
| send_day       | select-box | null: false                    |
| price          | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :buy


## buys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |
| card_number    | string     | null: false                    |
| card_exp_month | string     | null: false                    |
| card_exp_year  | string     | null: false                    |
| card_cvc       | string     | null: false                    |
| post_code      | string     | null: false                    |
| prefecture     | select-box | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :item


