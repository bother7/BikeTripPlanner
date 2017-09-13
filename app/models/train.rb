class Train < ApplicationRecord
  has_many :trainatstations
  has_many :stations, through: :trainatstations
end
