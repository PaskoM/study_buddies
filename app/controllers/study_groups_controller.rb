class StudyGroupsController < ApplicationController
    
    before_action :require_login

    def index
        @study_groups = StudyGroup.all.sort_by { |sg| sg.date }
        @subjects = Subject.all        
    end 

    def filter
        @subjects = Subject.all
        search_id = params[:search][:id]
        @filtered_groups = StudyGroup.filter(search_id.to_i)
        if !@filtered_groups.empty?
            @filtered_groups
        else
            @filtered_groups = StudyGroup.all
        end
    end

    def join
        @study_group = StudyGroup.find params[:id]
        @participant = Participant.create(user_id: current_user.id, study_group_id: @study_group.id)
        if !@participant.valid? 
            flash[:notice] = "This study group is now full"
            redirect_to @study_group
        else  
            redirect_to @study_group
        end 
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
        # byebug
        @study_group = StudyGroup.find(params[:id])
        @comment = Comment.new
        @comment.study_group_id = @study_group.id
        @comment.user_id = current_user.id
        # @comment.save
        
        @comments = @study_group.comments
    end 

    def create
        @study_group = StudyGroup.new(study_group_params)
        @study_group.user_id = current_user.id
        @study_group.save
        Participant.create(user_id: current_user.id, study_group_id: @study_group.id)
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
        @study_group.destroy
        redirect_to study_groups_path
    end
    

    private 

    def study_group_params 
        params.require(:study_group).permit(:user_id, :location_id, :subject_id, :date, :time, :num_participants, :duration, :description, :name)
    end
end
