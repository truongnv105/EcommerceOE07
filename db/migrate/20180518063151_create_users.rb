class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.string :password_digest
      t.string :phone_number
      t.string :activation_digest
      t.boolean :activated, default: false
      t.datetime :activated_at
      t.string :remember_digest
      t.boolean :is_admin, default: false
      t.string :address
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps
    end
  end
end
