# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| firstname          | string | null: false |
| lastname           | string | null: false |
| firstname furigana | string | null: false |
| lastname furigana  | string | null: false |
| bithday            | string | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| images      | string     | null: false                    |
| itemname    | string     | null: false                    |
| price       | string     | null: false                    |
| description | string     | null: false                    |
| category    | string     | null: false                    |
| state       | string     | null: false                    |
| burden      | string     | null: false                    |
| area        | string     | null: false                    |
| days        | string     | null: false                    |
| users_id    | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one : purchase

## purchase テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| users_id | references | null: false, foreign_key: true |
| items_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :sipping address

## sipping address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postalcode     | string     | null: false                    |
| prefectures    | string     | null: false                    |
| munitipalities | string     | null: false                    |
| address        | string     | null: false                    |
| phonenumber    | string     | null: false                    |
| puchase_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase