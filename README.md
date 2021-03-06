# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# users テーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| first_kana | string | null: false |
| last_kana  | string | null: false |
| birthday   | date   | null: false |

- has_many :products
- has_many :comments
- has_many :payments

# Products テーブル
| Column          | Type           | Options     |
| --------------- | -------------- | ----------- |
| image           | Active Storage | null: false |
| name            | string         | null: false |
| description     | text           | null: false |
| category        | int            | null: false |
| condition       | int            | null: false |
| shipping_charge | int            | null: false |
| prefecture      | string         | null: false |
| days_to_ship    | int            | null: false |
| price           | int            | null: false |
| user            | reference      | null: false |

-belongs_to :user
-has_many :comments
-has_one :payment

# Comments テーブル
| Column     | Type      | Options     |
| ---------- | ------    | ----------- |
| text       | text      | null: false |
| user       | reference | null: false |
| product    | reference | null: false |

-belongs_to :user
-belongs_to :product

# Payments テーブル
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| post_number   | string    | null: false |
| prefecture    | string    | null: false |
| municipality  | string    | null: false |
| address       | string    | null: false |
| building_name | string    | null: false |
| phone_number  | string    | null: false |
| product       | reference | null: false |
| user          | reference | null: false |

-belongs_to :user
-belongs_to :product

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
