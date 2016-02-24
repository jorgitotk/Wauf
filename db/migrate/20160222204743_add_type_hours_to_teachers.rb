class AddTypeHoursToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :class_hours, :integer
  end
end
