class Faculty < ActiveRecord::Base
	has_many :courses, dependent: :destroy
  has_many :faculty_teachers, dependent: :destroy
end
