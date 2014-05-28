class MembershipsController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @game.users << current_user
    redirect_to @game
  end
end
