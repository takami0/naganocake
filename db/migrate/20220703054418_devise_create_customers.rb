# frozen_string_literal: true

class DeviseCreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :last_name, null: false #姓
      t.string :first_name, null: false　#名
      t.string :last_name_kana, null: false #姓カナ
      t.string :first_name_kana, null: false #名カナ
      t.string :postal_code, null: false #郵便番号
      t.string :address, null: false #住所
      t.string :telephone_number, null: false #電話番号
      t.boolean :is_active, null: false, default: "TRUE" #会員ステータス

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :customers, :email,                unique: true
    add_index :customers, :reset_password_token, unique: true
    # add_index :customers, :confirmation_token,   unique: true
    # add_index :customers, :unlock_token,         unique: true

    create_table :addresses do |t|
      t.references :customer, foreign_key: true
      t.string :name, null: false #宛名
      t.string :postal_code, null: false #郵便番号
      t.string :address, null: false #住所
      t.datetime :created_at, null: false, default: now #登録日時
      t.datetime :updated_at, null: false, default: now #更新日時
    end

    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.string :shipping_postal_code, null: false #配送先郵便番号
      t.string :shipping_address, null: false #配送先住所
      t.string :shipping_name, null: false #配送先氏名
      t.integer :postage, null: false #送料
      t.integer :claim, null: false #請求金額
      t.integer :payment, null: false, default: "0" #支払方法
      t.integer :status, null: false, default: "0" #注文ステータス
      t.datetime :created_at, null: false, default: now
      t.datetime :updated_at, null: false, default: now
    end

    create_table :orders_histories do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :price_add_tax, null: false #購入時価格
      t.integer :amount, null: false #数量
      t.integer :product_status, null: false, default: "1" #製作ステータス
      t.datetime :created_at, null: false, default: now
      t.datetime :updated_at, null: false, default: now
    end

  end
end
