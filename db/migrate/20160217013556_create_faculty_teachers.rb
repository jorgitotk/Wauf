class CreateFacultyTeachers < ActiveRecord::Migration
  def change
    create_table :faculty_teachers do |t|
      t.integer :teacher_id
      t.integer :faculty_id

      t.timestamps null: false
    end
  end
end
