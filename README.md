# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |
| birthday           | date   | null: false               |

- has_many :items
- has_many :payments


# items テーブル
| Column             | Type            | Options           |
| ------------------ | --------------- | ----------------- |
| name               | string          | null: false       |
| description        | text            | null: false       |
| category_id        | integer         | null: false       |
| condition_id       | integer         | null: false       |
| shipping_charge_id | integer         | null: false       |
| prefecture_id      | integer         | null: false       |
| days_to_ship_id    | integer         | null: false       |
| price              | integer         | null: false       |
| user_id            | references      | foreign_key: true |

- belongs_to :user
- has_one :payment

# payments テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| item_id       | references | foreign_key: true |
| user_id       | references | foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

# addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| payment_id    | references | null: false, foreign_key: true |


- belongs_to :payment


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
