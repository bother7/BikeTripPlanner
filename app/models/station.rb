class Station < ApplicationRecord
  has_many :trainatstations
  has_many :trains, through: :trainatstations
end
