<% if @status.blank? %>
  alert("Datos registrados con éxito!");
  $(window).attr("location","<%= calendar_schedules_path %>");
<% else %>
  alert("<%= @status.html_safe %>");
  <% if @status == "Ya no tiene permisos para editar." %>
		$(window).attr("location","<%= calendar_schedules_path %>");
	<% end %>
<% end %>