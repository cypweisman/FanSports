class Contract < ApplicationRecord
  belongs_to :team
  belongs_to :player

  after_create :update_player_contract

  def update_player_contract
    player = Player.find(self.player_id)
    player.team_id = self.team_id
    player.save
  end

end