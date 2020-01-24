class SessionsController < ApplicationController

    def new 
    end 

    def create
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to study_groups_path  
        else 
            flash[:notice] = "Email or password incorrect"
            redirect_to '/login'
        end 
    end 

    def destroy 
        session[:user_id] = nil 
        redirect_to '/'
    end 
    

end 