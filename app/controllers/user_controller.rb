class UserController < ApplicationController

    def new 
        @user = User.new
        render :find
    end

    def show
        @user = User.find(params[:id])
        render :show
    end 

    def create
        @user = User.new(user_params)

        @user.favourite_language = @user.favourite_programming_language(@user.username)

        if @user.save
            redirect_to user_path(@user)
        else 
            render :new
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:username)
    end 
    

end
