class Availability < ActiveRecord::Base
	belongs_to :user
  validates_presence_of :start_time, :end_time

	enum day: [:Sun, :Mon, :Tue, :Wed, :Thu, :Fri, :Sat]

end
