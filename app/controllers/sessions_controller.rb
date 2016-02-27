class SessionsController < Devise::SessionsController
  def destroy
  	if current_teacher.can_register? or current_teacher.can_edit?
  		current_teacher.courses = []
  		current_teacher.availabilities = []
  		current_teacher.save
  		current_teacher.update(can_register: true)
  		current_teacher.update(can_edit: true)
  	end
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    yield if block_given?
    respond_to_on_destroy
  end
end