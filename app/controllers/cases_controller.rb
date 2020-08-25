class CasesController < ApplicationController

    def new 
        @users = User.all
        @case = Case.new
    end
    def show 
        @case = Case.find(params[:id])
    end

    # def category_attributes=(attr)
    #     self.category = Category_or_create_by(attr) if !attr[:name].blank?
    # end

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
