class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :category_id    , null: false
      t.integer :detail_id      , null: false
      t.integer :postage_id     , null: false
      t.integer :prefecture_id  , null: false
      t.integer :period_date_id , null: false
    end
  end
end
