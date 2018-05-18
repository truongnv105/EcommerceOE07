class CreateListCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :list_categories do |t|
      t.references :product, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
