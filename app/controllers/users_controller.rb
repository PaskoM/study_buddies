class UsersController < ApplicationController
    def welcome
    end

    def new 
        @user = User.new
    end 

    def show 
        @users = User.all 
    end 

    def create
        @user = User.create(user_params)
        if @user.valid?
            redirect_to study_groups_path 
        else 
            render 'new' 
        end 
    end 
    
    def edit 
        @user = User.find(params[:id])
    end 

    def update 
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.valid?
            redirect_to @user 
        else 
            render 'edit'  
        end 
    end
    

    private 

    def user_params 
        params.require(:user).permit(:name, :email, :password)
    end 
end
