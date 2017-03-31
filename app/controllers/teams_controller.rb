class TeamsController < ApplicationController

  def index
    @teams = Team.all
    @draft = Draft.new
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to team_path(@team)
    else
      render new_team_path
    end
  end

  def show
    @team = Team.find(params[:id])
  end

def team_params
  params.require(:team).permit(:name, :owner)
end

end