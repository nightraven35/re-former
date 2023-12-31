class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(allowed_post_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def allowed_post_params
    params.require(:user).permit(:username, :email, :password)
  end
end
