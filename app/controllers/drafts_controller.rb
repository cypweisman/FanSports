class DraftsController < ApplicationController
  def index
    @shuffled_teams = Team.all.shuffle
    @free_agents = Player.where(team_id: nil)
  end
end