class CasesController < ApplicationController
    def new 
        @users = User.all
        @case = Case.new
    end
    def show 
        @case = Case.find(params[:id])
    end

    def create 
        @case = Case.new(case_params)

        if @case.save 
            [params[:case][:pc_id], params[:case][:bi_id], params[:case][:client_id]].each{ |id|
            Casebi.create(case: @case,user_id:id)
        }
            redirect_to cases_path
        else
            render :new
        end
    end

    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @cases = @user.cases
        else 
            puts "TESSSSSSSSSSST"
            @error = "This user does not exist" if params[:user_id]
            @cases = Case.all
        end
    end

    def case_params 
        params.require(:case).permit(:pc_id, :bi_id, :client_id)
    end
end
