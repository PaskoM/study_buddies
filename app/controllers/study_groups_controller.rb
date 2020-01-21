class StudyGroupsController < ApplicationController

    def index
        @study_groups = StudyGroup.all
        @subjects = Subject.all        
    end 

    def filter
        @subjects = Subject.all
        search_id = params[:search][:id]
        @filtered_groups = StudyGroup.filter(search_id)
        if !@filtered_groups.empty?
            flash[:notice] = "hola"
            @filtered_groups
        else
            flash[:notice] = "hellu"
            @filtered_groups = StudyGroup.all
        end
    end

    def join
        @study_group = StudyGroup.find params[:id]
        Participant.create(user_id: current_user.id, study_group_id: @study_group.id)
        redirect_to @study_group
      end

    def new 
        @study_group = StudyGroup.new
    end 

    def show 
        @study_group = StudyGroup.find(params[:id])
   
    end 

    def create
        @study_group = StudyGroup.new(study_group_params)
        @study_group.user_id = current_user.id
        @study_group.save
        if @study_group.valid?
            redirect_to @study_group
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
        params.require(:study_group).permit(:user_id, :location_id, :subject_id, :date, :time, :num_participants, :duration, :description, :name)
    end
end
