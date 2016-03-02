<% if @status.blank? %>
  alert("Datos registrados con éxito!");
  $(window).attr("location","<%= calendar_schedules_path %>");
<% else %>
  alert("<%= @status.html_safe %>");
  <% if @status == "Ya no tiene permisos para editar, los cursos ya fueron registrados con éxito." %>
    <% if !@can_edit %>
      $(window).attr("location","<%= view_schedules_path %>");
    <% else %>
		  $(window).attr("location","<%= calendar_schedules_path %>");
    <% end %>
	<% end %>
<% end %>