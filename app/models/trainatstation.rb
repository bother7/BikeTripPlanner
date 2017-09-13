class Trainatstation < ApplicationRecord
  belongs_to :train
  belongs_to :station
end
