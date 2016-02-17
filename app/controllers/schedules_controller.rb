class SchedulesController < ApplicationController
	def index
	end

	def calendar
	end

	def assign
		new_availability = current_teacher.availabilities.find_or_initialize_by(day: params[:col].to_i, start_time: (params[:row].to_i + 8), end_time:(params[:row].to_i + 9))
		if new_availability.new_record?
			new_availability.save
		else
			new_availability.destroy
		end
	end

	def save_calendar
		current_teacher.update(can_edit: false)
		redirect_to calendar_schedules_path
	end

end
