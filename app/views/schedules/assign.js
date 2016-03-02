<% if @status.blank? %>
  alert("Horario registrados con éxito!");
  $(window).attr("location","<%= view_schedules_path %>");
<% else %>
  alert("<%= @status.html_safe %>");
  <% if @status == "Antes tiene que registrar sus cursos." %>
		$(window).attr("location","<%= root_path %>");
	<% end %>
  <% if @status == "No tiene permisos para editar el horario, ya fue registrado anteriormente con éxito." %>
		$(window).attr("location","<%= view_schedules_path %>");
	<% end %>
<% end %>