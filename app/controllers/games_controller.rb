class GamesController < ApplicationController
  before_action :load_game, only: [:show, :edit, :update, :destroy]

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
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  def join
    @game_members = Game.artist
  end

  private

  def load_game
    return @game = Game.find_by(id: params[:id])
  end

  def game_params
    params.require(:game).permit(:groupname, :max_members, :is_public)
  end

end
