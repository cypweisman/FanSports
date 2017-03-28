include DraftHelper

class ContractsController < ApplicationController

  def create
    p params
    @contract = Contract.create(team_id: params[:team_id], player_id: params[:player_id], salary: params[:salary], active: true)
    #do a after_create callback on the contract model
    @player = Player.find(@contract.player_id)
    @player.team_id = params[:team_id]
    @player.save
    @draft = Draft.find(params[:draft_id])
    @draft.next_pick
    redirect_to draft_path(@draft.id)
  end

  # def contract_params
  #   params.require(:contract).permit(:team_id, :player_id, :salary, :draft)
  # end

end