class AddTypeScheduleToUser < ActiveRecord::Migration
  def change
    add_column :teachers, :category, :integer
  end
end
