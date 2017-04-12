class Team < ApplicationRecord
  has_many :contracts
  has_many :players, through: :contracts

  validates :name, :presence => true, :uniqueness => true
  validates :owner, :presence => true, :uniqueness => true
end