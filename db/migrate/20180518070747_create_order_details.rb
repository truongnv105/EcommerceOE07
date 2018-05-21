class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.decimal :price, precision: 9, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end
