class RoutesController < ActionController::Base
  before_filter :authenticate_teacher!

  def root
    if current_teacher.can_edit?
      root_p = schedules_path
    else
      root_p = view_schedules_path
    end
    redirect_to root_p
  end
end