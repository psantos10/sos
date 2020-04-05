class CreateVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteers do |t|
      t.string :fullname
      t.string :email
      t.string :password_digest
      t.string :cellphone
      t.string :types_of_availability
      t.string :province
      t.string :county

      t.timestamps
    end
    add_index :volunteers, :email, unique: true
    add_index :volunteers, :cellphone, unique: true
  end
end
