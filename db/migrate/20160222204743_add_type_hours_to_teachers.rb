class AddTypeHoursToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :type_hours, :integer
  end
end
