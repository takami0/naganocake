class CreateOrdersHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :orders_histories do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :price_add_tax, null: false #購入時価格
      t.integer :amount, null: false #数量
      t.integer :product_status, null: false, default: "1" #製作ステータス
      t.timestamps
    end
  end
end
