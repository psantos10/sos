class CreateProvinces < ActiveRecord::Migration[6.0]
  def change
    create_table :provinces do |t|
      t.string :name

      t.timestamps
    end
    add_index :provinces, :name, unique: true
  end
end
