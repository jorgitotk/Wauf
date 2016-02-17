class FacultyTeacher < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :faculty
end
