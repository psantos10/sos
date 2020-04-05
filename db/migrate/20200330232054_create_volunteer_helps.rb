class CreateVolunteerHelps < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteer_helps do |t|
      t.references :volunteer, null: false, foreign_key: true
      t.references :help, null: false, foreign_key: true
      t.boolean :anonymous, defualt: false
      t.integer :status

      t.timestamps
    end
  end
end
