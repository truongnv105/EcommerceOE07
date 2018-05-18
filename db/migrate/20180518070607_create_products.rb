class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :describe
      t.decimal :price, precision: 9, scale: 2
      t.string :picture
      t.integer :discount
      t.boolean :feature
      t.string :RAM
      t.string :screen
      t.string :hard_disk
      t.boolean :status

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :price
  end
end
