class UsersController < ApplicationController
  before_action :require_current_user, only: [:edit]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @user_games = @user.games
  end

  def edit
  end

  private

  def require_current_user
    if !current_user?(@user)
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
