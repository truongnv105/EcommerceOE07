class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, unique: true
      t.text :describe
      t.decimal :price, precision: 9, scale: 2
      t.integer :discount
      t.integer :feature, null: false, default: 0
      t.string :RAM
      t.string :screen
      t.string :hard_disk
      t.integer :status, null: false, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :price
  end
end
