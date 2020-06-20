class AddUniqueIndexForVoluntueerIdOnVolunteerHelps < ActiveRecord::Migration[6.0]
  def change
    add_index :volunteer_helps, [:volunteer_id, :help_id], unique: true
  end
end
