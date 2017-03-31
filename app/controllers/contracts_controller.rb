include DraftHelper

class ContractsController < ApplicationController

  def new
    @freeagent = Player.find(params[:freeagent_id])
    @contract = Contract.new
  end

  def create
    p "--------------------------"
    p params
   # @contract = Contract.new(team_id: params[:team_id], player_id: params[:player_id], salary: params[:salary], active: true)
   @contract = Contract.new(contract_params)
    if @contract.save
      #take of failed save in both cases
      if @draft
        @draft = Draft.find(params[:draft_id])
        next_pick(@draft)
        redirect_to draft_path(@draft.id)
      else
        redirect_to player_path(@contract.player_id)
      end
    end
  end

  def contract_params
    params.require(:contract).permit(:team_id, :player_id, :salary, :active)
  end

end