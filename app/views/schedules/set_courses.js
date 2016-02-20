$('#list-courses').html('<%=escape_javascript render partial: "listing_courses", locals: { courses: @courses } %>');
