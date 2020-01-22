class CommentsController < ApplicationController

    def new
    @comment = Comment.new
    end
    
    def create
    @comment = Comment.new(comment_params)
    @comment.study_group_id = params[:id]
    @comment.user_id = current_user.id

    # @comment = @study_group.comments.new(comment_params)
    # @comment.user = current_user
    
    if @comment.save
        flash[:success] = "Comment successfully added"
        redirect_to study_group_path(@comment.study_group_id)
    else
        flash[:errors] = @comment.errors.full_messages
        redirect_to study_group_path(@comment.study_group_id)
    end
    end
    
    def show
        @comment = Comment.find(params[:id])

    end

    def edit
        @comment = Comment.find(params[:id])
    end 

    def update 
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        redirect_to study_group_path
    end 

    def destroy
        @comment = Comment.find(params[:id])
        study_group_id = @comment.study_group_id
        @study_group = StudyGroup.find(study_group_id)
        @comment.delete
        redirect_to study_group_path(@study_group)
    end 
    
    private
    
    def comment_params
        params.require(:comment).permit(:description)
    end
end
