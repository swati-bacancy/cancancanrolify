class ManageUsersController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if !@user.roles.blank?
        @user.remove_role :user
        @user.add_role :admin
      end
      redirect_to manage_users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def index
    @user = User.all
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
