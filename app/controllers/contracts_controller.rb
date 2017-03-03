class ContractsController < ApplicationController

  def create
    p params
    @contract = Contract.create(team_id: params[:team_id], player_id: params[:player_id], salary: params[:salary], active: true)
    @player = Player.find(@contract.player_id)
    @player.team_id = params[:team_id]
    @player.save
    redirect_to drafts_path
  end

end