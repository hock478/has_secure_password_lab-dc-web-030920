class SessionsController < ApplicationController

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        else
            redirect_to new_user_path
        end
    end

end
