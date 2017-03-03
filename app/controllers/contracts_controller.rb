include DraftHelper

class ContractsController < ApplicationController

  def create
    p params
    @contract = Contract.create(team_id: params[:team_id], player_id: params[:player_id], salary: params[:salary], active: true)
    @player = Player.find(@contract.player_id)
    @player.team_id = params[:team_id]
    @player.save
    @draft = Draft.find(params[:draft_id])
    @draft.next_pick
    #DEBUG NEXT STEP - WHY ITS CONTiNUIgn to go thru rounds
    if @draft.get_round == @draft.number_of_rounds + 1
      redirect_to teams_path
    else
      redirect_to draft_path(@draft.id)
    end
  end

  # def draft_params
  #   params.require(:contract).permit(:team_id, :player_id, :salary, :draft)
  # end

end