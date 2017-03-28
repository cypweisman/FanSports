include DraftHelper

class ContractsController < ApplicationController

  def create
    #p params
    @contract = Contract.create(team_id: params[:team_id], player_id: params[:player_id], salary: params[:salary], active: true)
    @draft = Draft.find(params[:draft_id])
    next_pick(@draft)
    redirect_to draft_path(@draft.id)
  end

  # def contract_params
  #   params.require(:contract).permit(:team_id, :player_id, :salary, :draft)
  # end

end