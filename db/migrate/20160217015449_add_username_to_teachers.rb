class AddUsernameToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :username, :string
    add_index :teachers, :username, unique: true
  end
end
