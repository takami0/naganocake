class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :genre, foreign_key: true
      t.string :name, null: false #商品名
      t.text :introduction, null: false #商品説明文
      t.integer :price, null: false #税抜価格
      t.boolean :is_active, null: false, default: "TRUE" #販売ステータス
      t.timestamps
    end
    
    create_table :genres do |t|
      t.string :name, null: false, default: "0" #ジャンル名
      t.datetime :created_at, null: false, default: now
      t.datetime :updated_at, null: false, default: now
    end
    
    create_table :cart_items do |t|
      t.references :item, foreign_key: true
      t.references :customer, foreign_key: true
      t.integer :amount, null: false
      t.datetime :created_at, null: false, default: now
      t.datetime :updated_at, null: false, default: now
    end
    
  end
end
