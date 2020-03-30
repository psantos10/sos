class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone, null: false
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :phone, unique: true
    add_index :users, unique: true
  end
end
