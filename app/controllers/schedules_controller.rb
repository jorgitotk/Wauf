class SchedulesController < ApplicationController
	def index
		@eap = Faculty.where(parent_id: 1)
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

	def pick_courses
		if params[:courses].blank?
			@status = "Debe elegir al menos un curso."
		end
		if params[:mode_type_select].blank?
			@status = "Debe elegir al menos una opcion en el área de Modo de Trabajo."
		end
		if @status.blank?
			redirect_to calendar_schedules_path
		end

	end

	def set_courses
		@courses = Course.where(faculty_id: params[:id])
	end

	def save_calendar
		current_teacher.update(can_edit: false)
		redirect_to calendar_schedules_path
	end

end
