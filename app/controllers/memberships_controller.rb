class MembershipsController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    if @game.max_members > @game.users.count
      @game.users << current_user
      redirect_to @game
    else
      redirect_to @game
    end
  end
end
