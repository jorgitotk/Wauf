class Course < ActiveRecord::Base
	belongs_to :faculty
  has_many :course_teachers, dependent: :destroy
end
