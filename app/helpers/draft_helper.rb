module DraftHelper
  @@shuffled_teams = []
  @@round = 1
  @@drafting_counter = 0

  def get_drafting_counter
    @@drafting_counter
  end

  def get_round
    @@round
  end

  def set_shuffled_teams
    @@shuffled_teams = Team.all.shuffle
  end

  def get_shuffled_teams
    if @@shuffled_teams == []
      set_shuffled_teams
    end
    @@shuffled_teams
  end

  def next_pick
    if @@drafting_counter != @@shuffled_teams.length - 1
      @@drafting_counter +=1
    else
      @@drafting_counter = 0
      @@shuffled_teams.reverse!
      @@round +=1
    end
  end
end
