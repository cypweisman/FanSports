class Player < ApplicationRecord
  has_many :contracts
  has_many :teams, through: :contracts
  #refactor with has_one

  def active_contract
    contract = self.contracts.where(active: true).last
    #contract.salary
    if contract != nil
      return contract.salary
    else
      return "n/a"
    end
  end
end
