class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to player_path(@player)
    else
      render new_player_path
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def freeagents_index
    @freeagents = Player.where(team_id: nil)
  end

  def player_params
    params.require(:player).permit(:name, :rating)
  end

end