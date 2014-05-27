class GamesController < ApplicationController

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

  private

  def game_params
    params.require(:game).permit(:groupname, :max_members, :is_public)
  end

end
