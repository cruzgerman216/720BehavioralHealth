class CommentsController < ApplicationController
    def create 
        appointment = Appointment.find(params[:appointment_id])
        appointment.comments.create(content:params[:comment][:content], user: current_user)
        redirect_to appointment_path(appointment)
    end
end
