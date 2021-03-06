# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# users テーブル
| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| email              | string | null: false, foreign_key: true |
| encrypted_password | string | null: false                    |
| nickname           | string | null: false                    |
| first_name         | string | null: false                    |
| last_name          | string | null: false                    |
| first_kana         | string | null: false                    |
| last_kana          | string | null: false                    |
| birthday           | date   | null: false                    |

- has_many :products
- has_many :payments
- has_one :address

# Products テーブル
| Column          | Type            | Options     |
| --------------- | --------------- | ----------- |
| name            | string          | null: false |
| description     | text            | null: false |
| category_id     | integer         | null: false |
| condition       | integer         | null: false |
| shipping_charge | integer         | null: false |
| prefecture_id   | integer         | null: false |
| days_to_ship    | integer         | null: false |
| price           | integer         | null: false |
| user            | references      | null: false |

-belongs_to :user
-has_one :payment

# Payments テーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| product       | references | null: false |
| user          | references | null: false |

-belongs_to :user
-belongs_to :product

# Address テーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| post_number   | string     | null: false |
| prefecture_id | integer    | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |
| user          | references | null: false |

- belongs_to :user


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
