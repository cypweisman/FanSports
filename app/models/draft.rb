class Draft < ApplicationRecord

	validates :number_of_rounds, :presence => true, numericality: { only_integer: true }

end