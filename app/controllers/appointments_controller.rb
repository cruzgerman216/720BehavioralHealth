class AppointmentsController < ApplicationController
     before_action :redirect_if_not_logged_in

    def new 
        if params[:case_id] && @case = Case.find_by_id(params[:case_id])
            @appointment = @case.appointments.build
        else
            @appointment = Appointment.new
        end
    end

    def create 
        client_case =  Case.find(params[:appointment][:case_id])
        @appointment = client_case.appointments.build(appointment_params)
        if @appointment.save 
            @appointment.comments.build(content:"",user:client_case.bi).save
            @appointment.comments.build(content:"",user: client_case.client).save
            redirect_to case_appointments_path(@appointment.case)
        else
            render :new
        end
    end

    def index 
        if @object = Case.find_by_id(params[:case_id]) || User.find_by_id(params[:user_id])
            @appointments = @object.appointments.order_by_date
        else 
            @error = "This user does not exist" if params[:case_id]
            @appointments = Appointment.order_by_date
        end
        
    end

    def show
        @appointment = Appointment.find(params[:id])
    end

    private 

    def appointment_params 
        params.require(:appointment).permit(:from_time, :to_time, :date, :case_id)
    end
end



