class StudyGroupsController < ApplicationController

    def index
        @study_groups = StudyGroup.all 
    end 

    def new 
        @study_group = StudyGroup.new
    end 

    def show 
        @study_groups = StudyGroup.all 
    end 

    def create
        @study_group = StudyGroup.create(study_group_params)
        if @study_group.valid?
            redirect_to study_groups_path 
        else 
            render 'new' 
        end 
    end 
    
    def edit 
        @study_group = StudyGroup.find(params[:id])
    end 

    def update 
        @study_group = StudyGroup.find(params[:id])
        @study_group.update(study_group_params)
        if @study_group.valid?
            redirect_to @study_group 
        else 
            render 'edit'  
        end 
    end
    

    private 

    def study_group_params 
        params.require(:study_group).permit(:user_id, :location_id, :subject_id, :date, :time, :num_participants, :duration)
    end
end
