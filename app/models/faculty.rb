class Faculty < ActiveRecord::Base
	has_many :courses
  has_many :faculty_teachers
end
