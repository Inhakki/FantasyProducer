class GamesController < ApplicationController
  before_action :load_game, only: [ :show, :edit, :update, :destroy]
  before_action :load_member, only: [ :index, :show ]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    redirect_to games_path
  end

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to games_path
  end

  def show
    @users_in_game = @game.users
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  private

  def load_member
    return @current_member = Membership.where(game_id: params[:id], user_id: current_user.id)
  end

  def load_game
    return @game = Game.find_by(id: params[:id])
  end

  def game_params
    params.require(:game).permit(:groupname, :max_members, :is_public)
  end

end
