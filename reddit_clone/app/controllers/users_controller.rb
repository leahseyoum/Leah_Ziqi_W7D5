class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            #redirect to index page
        else
            flash.now[:errors] = @user.errors.full_messages
            #render new view
        end
    end

    def new
        @user = User.new
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
