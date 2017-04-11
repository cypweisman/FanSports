class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to player_path(@player)
    else
      @errors = @player.errors.full_messages
      render new_player_path
    end
  end

  def show
    @player = Player.find(params[:id])
    @active_contract = @player.active_contract
  end

  def freeagents_index
    @freeagents = Player.where({:account_id => session[:account_id], :team_id => nil})
  end

  def player_params
    params.require(:player).permit(:name, :rating, :account_id)
  end

end