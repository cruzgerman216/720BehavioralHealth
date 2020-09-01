class User < ApplicationRecord
    has_many :cases, ->(user){
        unscope(:where).where(pc:user).or(where(client: user)).or(where(bi:user))
    }
    has_many :appointments, through: :cases

    has_many :comments
    has_many :commented_appointments, through: :comments, source: :appointment

    enum role: [:program_coordinator, :behavioral_therapist, :client]

    has_secure_password 
    validates :email, :first_name, :last_name, presence: true
    validates_uniqueness_of :email

    def return_last_to_first_name 
        self.last_name + ", " + self.first_name
    end

    def return_initials
        self.first_name[0..1] + "." + self.last_name[0..1]
    end
end





# <div class="container" style="text-align:center">
    # <div class="row" >
    #     <div class="col-3" style="border: 1px black solid; font-weight: bold;">
    #         Case #
    #     </div>
    #     <div class="col-3" style="border: 1px black solid; font-weight: bold;">
    #         Last Name, First Name
    #     </div>
    #     <div class="col-3" style="border: 1px black solid; font-weight: bold;">
    #         Time
    #     </div>
    #             <div class="col-3" style="border: 1px black solid; font-weight: bold;">
    #         Date
    #     </div>
    # </div>
    #     <div class="row" >
    #         <div class="col-3" style="border: 1px black solid;">
    #             <%=@appointment.id%>
    #         </div>
    #         <div class="col-3" style="border: 1px black solid;">
    #             <%=@appointment.case.client.return_last_to_first_name%>
    #         </div>
    #         <div class="col-3" style="border: 1px black solid;">
    #             <%=@appointment.from_time.strftime("%I:%M %p")%> - <%=@appointment.to_time.strftime("%I:%M %p")  %>
    #         </div>
    #         <div class="col-3" style="border: 1px black solid;">
    #             <%=@appointment.date.strftime("%m/%d/%Y")%>
    #         </div>
    # </div>


    # <%@appointment.comments.each do |c|%>
    #    <div class="row" >
    #         <div class="col-3" style="border: 1px black solid;">
    #             <%=c.user.first_name%>
    #         </div>
    #         <div class="col-9" style="border: 1px black solid;">
    #             <%=c.content%>
    #         </div>
    # </div>
    # <%end%>
# </div>

# <%@appointment.comments.each do |c|%>
#         <p><b><%=c.user.first_name%></b> <%=c.content%>
#     <%end%>

# <%= form_for Comment.new do |f|%>
#     <%= hidden_field_tag 'appointment_id', @appointment.id%>
#     <%= f.label :content %>
#     <%= f.text_area :content%>
#     <br>
#     <%= f.submit "Submit"%>
# <% end %>