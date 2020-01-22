class StudyGroupsController < ApplicationController

    def index
        @study_groups = StudyGroup.all
        @subjects = Subject.all        
    end 

    def filter
        @subjects = Subject.all
        search_id = params[:search][:id]
        @filtered_groups = StudyGroup.filter(search_id.to_i)
        # byebug
        if !@filtered_groups.empty?
            flash[:notice] = "Please update your search"
            @filtered_groups
        else
            flash[:notice] = "Search again"
            @filtered_groups = StudyGroup.all
        end
    end

    def join
        @study_group = StudyGroup.find params[:id]
        Participant.create(user_id: current_user.id, study_group_id: @study_group.id)
        redirect_to @study_group
    end

    def leave
        @study_group = StudyGroup.find params[:id]
        Participant.find_by(user_id: current_user.id, study_group_id: @study_group.id).destroy
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
            flash[:errors] = @study_group.errors.full_messages
            render 'new' 
        end 
    end 
    
    def edit 
        @study_group = StudyGroup.find(params[:id])
    end 

    def update 
        @study_group = StudyGroup.find(params[:id])
        @study_group.user_id = current_user.id
        @study_group.update(study_group_params)
        if @study_group.valid?
            redirect_to @study_group 
        else 
            flash[:errors] = @study_group.errors.full_messages
            render 'edit'  
        end 
    end

    def destroy
        @study_group = StudyGroup.find(params[:id])
        @study_group.delete
        redirect_to '/'
    end
    

    private 

    def study_group_params 
        params.require(:study_group).permit(:user_id, :location_id, :subject_id, :date, :time, :num_participants, :duration, :description, :name)
    end
end
