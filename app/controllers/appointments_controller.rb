class AppointmentsController < ApplicationController
    # before_action :redirect_if_not_logged_in

    def new 
        if params[:case_id] && @case = Case.find_by_id(params[:case_id])
            @appointment = @case.appointments.build
        else
            @appointment = Appointment.new
        end
    end

    def create 
        # @psot = current_user.posts.build(post_params)
        client_case = Case.find(params[:case_id])
        @appointment = client_case.appointments.build(appointment_params)
        if @appointment.save 
            redirect_to case_appointments_path(@appointment.case)
        else
            render :new
        end
    end

    def index 
        # @appointment = current_user.appointments
        @appointments = Appointment.all
    end

    def show
        puts params
        @appointment = Appointment.find(params[:id])
    end

    private 

    def appointment_params 
        params.require(:appointment).permit(:from_time, :to_time, :date, :case_id)
    end
end



