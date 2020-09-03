class CasesController < ApplicationController
    def new 
        @case = Case.new
    end
    def show 
        @case = Case.find(params[:id])
    end

    # check 
    def create 
        pc = User.find_by_id(case_params[:pc_id])
        bi = User.find_by_id(case_params[:bi_id])
        client = User.find_by_id(case_params[:client_id])
        @case = Case.new(pc: pc, bi: bi, client: client)
        if @case.save 
            case_params.each{ |k,v|
                Casebi.create(case: @case,user_id:v.to_i)
            }
            redirect_to cases_path
        else
            render :new
        end
    end

    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @cases = @user.cases.order_by_last_name
        else 
            @error = "This user does not exist" if params[:user_id]
            @cases = Case.order_by_last_name
        end
    end

    def case_params 
        params.require(:case).permit(:pc_id, :bi_id, :client_id)
    end
end
