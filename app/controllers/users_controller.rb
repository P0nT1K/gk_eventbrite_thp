class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    user_params = params.require(:user).permit(:first_name, :last_name, :description)
    if @user.update(user_params)
      flash[:success] = "User succesfully updated"
      redirect_to @user
    else
      render 'edit'
    end

  end




end
