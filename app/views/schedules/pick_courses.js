<% if @status.blank? %>
  alert("esto esta boni boni");
<% else %>
  alert("<%= @status.html_safe %>");
<% end %>