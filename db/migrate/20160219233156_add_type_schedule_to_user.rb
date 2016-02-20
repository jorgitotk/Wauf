class AddTypeScheduleToUser < ActiveRecord::Migration
  def change
    add_column :teachers, :type_schedule, :integer
  end
end
