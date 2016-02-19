class SchedulesController < ApplicationController
	def index
	end

	def calendar
	end

	def assign
		size = params[:hours_ids].size
    unless (params[:days_ids].blank? and params[:hours_ids].blank?)
			size.times do |i|
				if current_teacher.can_edit?
					new_availability = current_teacher.availabilities.find_or_initialize_by(day: params[:days_ids][i].to_i, start_time: (params[:hours_ids][i].to_i + 8), end_time:(params[:hours_ids][i].to_i + 9))
					if new_availability.new_record?
						new_availability.save
					else
						new_availability.destroy
					end
	      end
	    end
    end
    redirect_to calendar_schedules_path
	end

	def save_calendar
		current_teacher.update(can_edit: false)
		redirect_to calendar_schedules_path
	end

end
