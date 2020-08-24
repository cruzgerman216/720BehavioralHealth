class CommentsController < ApplicationController
    def create 
        appointment = Appointment.find(params[:appointment_id])
        Comment.create(content:params[:comment][:content], user: current_user, appointment: appointment)
        redirect_to appointments_path(appointment)
    end
end
