class UsersController < ApplicationController

    def index
        @name = session[:name]
    end

    def new

    end

    def create
        @user = User.create(user_params)
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to users_path
        else
            redirect_to new_user_path
        end
        
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
