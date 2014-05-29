class MembershipsController < ApplicationController
  before_action :find_game

  def create
    if @game.max_members > @game.users.count
      @game.users << current_user
      redirect_to @game
    else
      redirect_to @game, :flash => { error: "The game is full." }
    end
  end

  def destroy
    leave = Membership.where(user_id: params[:id], game_id: params[:game_id])
    Membership.destroy(leave)
    redirect_to @game
  end

  private

  def find_game
   @game = Game.find(params[:game_id])
  end
end
