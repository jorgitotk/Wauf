class SchedulesController < ApplicationController
	def index
		@eap = Faculty.where(parent_id: 1)
	end

	def calendar
	end

	def assign
		if current_teacher.can_register?
	  	@status = "Antes tiene que registrar sus cursos."
		else
			if current_teacher.can_edit?
		    unless (params[:days_ids].blank? and params[:hours_ids].blank?)
					size = params[:hours_ids].size
					if size > (current_teacher.past_hours.to_i - 1) and size <= Teacher.class_hours[current_teacher.class_hours]
						current_teacher.update(current_hours: size)
						size.times do |i|
							if current_teacher.can_edit?
								new_availability = current_teacher.availabilities.create(day: params[:days_ids][i].to_i, start_time: (params[:hours_ids][i].to_i + 8), end_time:(params[:hours_ids][i].to_i + 9))
				      end
				    end
					else
						if Teacher.class_hours[current_teacher.class_hours] == 8
			  			@status = "Debe escojer una cantidad de horas igual a 8."
						else
			  			@status = "Debe escojer una cantidad de horas mayor a " + current_teacher.past_hours + " y menor o igual a " + Teacher.class_hours[current_teacher.class_hours].to_s + "."
						end
					end
			  else
			  	@status = "Debe registrar un horario para continuar."
		    end
		    current_teacher.update(can_edit: false) if @status.blank?
			else
		  	@status = "No tiene permisos para editar el horario, ya fue registrado anteriormente con éxito."
			end
		end
	end

	def pick_courses
		@can_edit = current_teacher.can_edit
		if current_teacher.can_register?
			if params["Select EAP"].blank?
				@status = "Debe seleccionar una escuela académico profesional."
			else
				if params[:courses].blank?
					@status = "Debe elegir al menos un curso."
				else
					current_teacher.courses = Course.where(id: params[:courses])
	    		current_teacher.update(can_register: false)
				end
			end
		else
			@status = "Ya no tiene permisos para editar, los cursos ya fueron registrados con éxito."
		end
	end

	def set_courses
		@courses = Course.where(faculty_id: params[:id])
	end

	def view
	end

end
