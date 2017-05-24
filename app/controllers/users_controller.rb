class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    return redirect_to new_user_path unless @user.save
    session[:user_id] = @user.id
    redirect_to '/'
  end

  # def show
  #   find_user
  # end
  #
  # def edit
  #   find_user
  # end
  #
  # def update
  #   find_user
  #   @user.update(user_params)
  # end
  #
  # def destroy
  #   find_user.delete
  # end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # def find_user
  #   @user = User.find(params[:id])
  # end

end

  # def index
  #   @users = User.all
  # end
