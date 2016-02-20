class AddColumnToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :can_register, :boolean, default: true, null: false
  end
end
