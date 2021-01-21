# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| first_name         | string     | null: false |
| last_name          | string     | null: false |
| first_name_kana    | string     | null: false |
| last_name_kana     | string     | null: false |
| birthday           | date       | null: false |

### Association

- has_many :items
- has_many :buys


## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item_name         | string     | null: false                    |
| item_info         | text       | null: false                    |
| item_category_id  | string     | null: false                    |
| item_condition_id | string     | null: false                    |
| shipping_fee_id   | string     | null: false                    |
| send_area_id      | string     | null: false                    |
| send_day_id       | string     | null: false                    |
| price             | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :buys


## buys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |

### Association

- belongs_to :buy

