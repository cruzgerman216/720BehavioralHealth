class User < ApplicationRecord
    has_secure_password #authenticate, validate password &/or password confirmation
    enum role: [:program_coordinator, :behavioral_therapist, :client]

    has_many :casebis
    has_many :cases, :through => :casebis 
    
    has_many :comments
    has_many :commented_appointments, through: :comments, source: :appointment
end

# new, show, or index 

# '/users'

# '/users/:id/cases'

# '/cases'

# '/appointments/:id/comments'

# '/comments'


# <% @case.appointments.each do |a|%>

#     <div>
#         <br>
#         <%= link_to "Appointment", appointment_path(a) %>
#         <h3>Time</h3>
#         <%=a.from_time%> - <%=a.to_time%>
#         <br>
#         <h3>Date</h3>
#         <%=a.date%>
    
#         <h4>Comments</h4>
    
#         <%a.comments.each do |c|%>
#             <p><b><%=c.user.first_name%></b> <%=c.content%>
#         <%end%>
#     </div>
    
#     <%end%>