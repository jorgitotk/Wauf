class CreateCourseTeachers < ActiveRecord::Migration
  def change
    create_table :course_teachers do |t|
      t.integer :teacher_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
