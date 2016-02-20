class SchedulesController < ApplicationController
	def index
		@eap = Faculty.where(parent_id: 1)
	end

	def calendar
	end

	def assign
		if current_teacher.can_edit?
	    unless (params[:days_ids].blank? and params[:hours_ids].blank?)
				size = params[:hours_ids].size
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
	    current_teacher.update(can_edit: false)
	    redirect_to calendar_schedules_path
		else
			render js: "alert('Ya no tiene permisos para editar el calendario.');"
		end
	end

	def pick_courses
		if current_teacher.can_register?
			if params[:courses].blank?
				@status = "Debe elegir al menos un curso."
			else
				current_teacher.courses = Course.where(id: params[:courses])
    		current_teacher.update(can_register: false)
			end
		else
			render js: "alert('Ya no tiene permisos para editar.');"
		end
	end

	def set_courses
		@courses = Course.where(faculty_id: params[:id])
	end

end
