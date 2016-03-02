class Availability < ActiveRecord::Base
	belongs_to :user
  validates_presence_of :start_time, :end_time

	enum day: [:Dom, :Lun, :Mar, :Mie, :Jue, :Vie, :Sab]

end
