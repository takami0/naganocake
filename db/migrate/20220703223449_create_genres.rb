class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false, default: "0" #ジャンル名
      t.timestamps
    end
  end
end
