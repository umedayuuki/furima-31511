# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| firstname          | string | null: false |
| lastname           | string | null: false |
| firstname furigana | string | null: false |
| lastname furigana  | string | null: false |
| bithday            | date   | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| price       | integer    | null: false                    |
| description | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| burden_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| days_id     | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one : purchase

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :sipping address

## sipping address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postalcode     | string     | null: false                    |
| area           | string     | null: false                    |
| munitipalities | string     | null: false                    |
| address        | string     | null: false                    |
| phonenumber    | string     | null: false                    |
| puchase        | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase