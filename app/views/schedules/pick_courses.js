<% if @status.blank? %>
  alert("Datos registrados con éxito!");
  $(window).attr("location","<%= calendar_schedules_path %>");
<% else %>
  alert("<%= @status.html_safe %>");
<% end %>