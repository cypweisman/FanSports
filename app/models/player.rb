class Player < ApplicationRecord
  has_many :contracts
  has_many :teams, through: :contracts
  #refactor with has_one
end
