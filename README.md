

## usersテーブル
| Column     | Type        | Options      |
|:-----------|------------:|:------------:|
| nickname   | string      | null: false  |
| email      | string      | null: false  |
| password   | string      | null: false  |
| name       | string      | null: false  |
| birthday   | date        | null: false  |
### Association
- has_many :items
- has_many :comments
- has_many :buys

## itemsテーブル
| Column     | Type        | Options                       |
|:-----------|------------:|:-----------------------------:|
| image      | string      | null: false                   |
| goode-name | string      | null: false                   |
| explanation| string      | null: false                   |
| detail     | string      | null: false                   |
| postage    | date        | null: false                   |
| price      | date        | null: false                   |
| user_id    | references  | null: false, foreign_key: true|
### Association
- has_many :comments
- belongs_to :user
- has_one :item

## commentsテーブル
| Column     | Type        | Options                       |
|:-----------|------------:|:-----------------------------:|
| comment    | string      |                               |
| user_id    | references  | null: false, foreign_key: true|
| item_id    | references  | null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## buys テーブル
| Column     | Type        | Options                       |
|:-----------|------------:|:-----------------------------:|
| address    | string      |                               |
| user_id    | references  | null: false, foreign_key: true|
| item_id    | references  | null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user
