class CreateHelps < ActiveRecord::Migration[6.0]
  def change
    create_table :helps do |t|
      t.string :help_type
      t.string :title
      t.text :description
      t.string :fullname
      t.string :email
      t.string :cellphone
      t.string :alternative_cellphone
      t.string :province
      t.string :county
      t.string :district
      t.string :neighborhood
      t.string :address
      t.integer :status

      t.timestamps
    end
    add_index :helps, :email
    add_index :helps, :status
  end
end
