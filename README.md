# テーブル設計

## users table

| Column             | Type             | Options                   |
|--------------------|------------------|---------------------------|
| nickname           | string           | null: false               |
| email              | string           | null: false, unique: true |
| encrypted_password | string           | null: false               |
| last_name          | string           | null: false               |
| first_name         | string           | null: false               |
| last_name_kana     | string           | null: false               |
| first_name_kana    | string           | null: false               |
| birthday           | date             | null: false               |

### Association

* has_many :items
* has_many :comments
* has_many :orders

## items table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| title            | string     | null: false                    |
| review           | text       | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_id      | integer    | null: false                    |
| region_id        | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
* has_many :comments
* has_one :order

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
* has_one :address

## addresses table

| Column          | Type             | Options                        |
|-----------------|------------------|--------------------------------|
| post_code       | string           | null: false                    |
| region_id       | integer          | null: false                    |
| city            | string           | null: false                    |
| block_number    | string           | null: false                    |
| building_name   | string           |                                |
| phone           | string           | null: false                    |
| order           | references       | null: false, foreign_key: true |


### Association

- belongs_to :order
