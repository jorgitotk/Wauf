class AddNoNullToTables < ActiveRecord::Migration
  def change
    change_column :teachers, :username, :string, null: false
    change_column :faculties, :name, :string, null: false
    change_column :courses, :code, :string, null: false
    change_column :courses, :name, :string, null: false
  end
end
