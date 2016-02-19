class Availability < ActiveRecord::Base
	belongs_to :user
  validates_presence_of :start_time, :end_time

	enum day: [:Sun, :Mon, :Tue, :Wed, :Thu, :Fri, :Sat]

	def self.is_selected? user, col, row
		availability = user.availabilities
		a = Availability.find_by(day: col.to_i, start_time: (row.to_i + 8), end_time:(row.to_i + 9))
		availability.include?(a) ? true : false
	end

end
