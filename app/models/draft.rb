class Draft < ApplicationRecord
  attr_accessor :round, :shuffled_teams, :drafting_counter

  def initialize(draft_params)
    super(draft_params)
    round = 1
    drafting_counter = 0
    shuffled_teams = []
  end

  # @@shuffled_teams = []
  # @@round = 1
  # @@drafting_counter = 0

  def get_drafting_counter
    drafting_counter
  end

  # def set_drafting_counter(number)
  #   drafting_counter = drafting_counter + number
  # end

  def get_round
    round
  end

  def set_shuffled_teams
    round = 1
    drafting_counter = 0
    shuffled_teams = Team.all.shuffle
  end

  def get_shuffled_teams
    if shuffled_teams == []
      #was not working when == nil
      set_shuffled_teams
    end
    shuffled_teams
  end

  def next_pick
    if drafting_counter != shuffled_teams.length - 1
      drafting_counter +=1
    else
      drafting_counter = 0
      shuffled_teams.reverse!
      round +=1
      if round == self.number_of_rounds + 1
        self.open = false
        self.save
      end
    end
  end
end