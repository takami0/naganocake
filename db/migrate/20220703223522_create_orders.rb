class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.string :shipping_postal_code, null: false #配送先郵便番号
      t.string :shipping_address, null: false #配送先住所
      t.string :shipping_name, null: false #配送先氏名
      t.integer :postage, null: false #送料
      t.integer :claim, null: false #請求金額
      t.integer :payment, null: false, default: "0" #支払方法
      t.integer :status, null: false, default: "0" #注文ステータス
      t.timestamps
    end
  end
end
