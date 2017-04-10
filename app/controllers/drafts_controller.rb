include DraftHelper


class DraftsController < ApplicationController

  def create
    p params
    @draft = Draft.new(draft_params)
    if @draft.save
      create_draft_variables(@draft.id)
      redirect_to draft_path(@draft)
    else
      render teams_path
    end
  end

  def show
    @draft = Draft.find(params[:id])
    @shuffled_teams = session[:shuffled_teams]
    @teams_objects = Team.where(account_id: session[:account_id])
    # p "------------------------"
    # p session[:shuffled_teams]
    @free_agents = Player.where({:account_id => session[:account_id], :team_id => nil})
    @drafting_team = @shuffled_teams[session[:drafting_counter]]
    @contract = Contract.new




  end

  def draft_params
    params.require(:draft).permit(:number_of_rounds)
  end
end