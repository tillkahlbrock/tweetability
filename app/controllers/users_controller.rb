class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  # creates a user
  def create
    @user = User.new(post_params)

    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def post_params
    params.require(:user).permit(:name, :password, :password_confirmation, :handle)
  end
end
