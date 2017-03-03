class TeamsController < ApplicationController

  def index
    @teams = Team.all
    @draft = Draft.new
  end

  def show
    @team = Team.find(params[:id])
  end

end