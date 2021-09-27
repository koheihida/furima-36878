

## usersテーブル
| Column            | Type        | Options                   |
|:------------------|------------:|:-------------------------:|
| nickname          | string      | null: false               |
| email             | string      | null: false , unique:true |
| encrypted_password| string      | null: false               |
| first_name        | string      | null: false               |
| family_name       | string      | null: false               |
| first_name_kana   | string      | null: false               |
| family_name_kana  | string      | null: false               |
| birthday          | date        | null: false               |
### Association
- has_many :items
- has_many :comments
- has_many :buys

## itemsテーブル
| Column        | Type        | Options                       |
|:--------------|------------:|:-----------------------------:|
| goode_name    | string      | null: false                   |
| explanation   | text        | null: false                   |
| category_id   | integer     | null: false                   |
| detail_id     | integer     | null: false                   |
| postage_id    | integer     | null: false                   |
| prefectures_id| integer     | null: false                   |
| period_date_id| integer     | null: false                   |
| price         | int         | null: false                   |
| user          | references  | null: false, foreign_key: true|
### Association
- has_many :comments
- belongs_to :user
- has_one :buy

## commentsテーブル
| Column     | Type        | Options                       |
|:-----------|------------:|:-----------------------------:|
| comment    | string      |                               |
| user       | references  | null: false, foreign_key: true|
| item       | references  | null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## buys テーブル
| Column     | Type        | Options                       |
|:-----------|------------:|:-----------------------------:|
| user       | references  | null: false, foreign_key: true|
| item       | references  | null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user
- has_one    :address

## address テーブル
| Column        | Type        | Options                       |
|:--------------|------------:|:-----------------------------:|
| postcode      | int         | null: false                   |
| prefectures_id| integer     | null: false                   |
| city          | string      | null: false                   |
| block         | string      | null: false                   |
| building      | string      | null: false                   |
| tel_number    | string      | null: false                   |
| buy           | references  | null: false, foreign_key: true|
- belongs_to :buy

