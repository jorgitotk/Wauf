<% if @status.blank? %>
  alert("Horario registrados con éxito!");
  $(window).attr("location","<%= view_schedules_path %>");
<% else %>
  alert("<%= @status.html_safe %>");
  <% if @status == "Ya no tiene permisos para editar el calendario." %>
		$(window).attr("location","<%= view_schedules_path %>");
	<% end %>
<% end %>