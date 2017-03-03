module DraftHelper
  @@shuffled_teams = []
  def set_shuffled_teams
    @@shuffled_teams = Team.all.shuffle
  end

  def get_shuffled_teams
    if @@shuffled_teams == []
      set_shuffled_teams
    end
    @@shuffled_teams
  end
end
