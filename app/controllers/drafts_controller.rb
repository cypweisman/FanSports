include DraftHelper

class DraftsController < ApplicationController
  def index
    @shuffled_teams = get_shuffled_teams
    @free_agents = Player.where(team_id: nil)
    @drafting_team = @shuffled_teams[0]
  end
end