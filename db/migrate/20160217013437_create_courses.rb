class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.integer :faculty_id

      t.timestamps null: false
    end
  end
end
