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
| birthday           | datetime         | null: false               |

### Association

* has_many :items
* has_many :comments
* has_one :order

## items table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| title              | string     | null: false                    |
| review             | text       | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user

## orders table

| Column        | Type       | Options                        |
|-------------  |------------|--------------------------------|
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| shipping      | string     | null: false                    |
| region        | string     | null: false                    |
| shipping_date | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user