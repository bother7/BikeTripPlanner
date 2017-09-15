class User < ApplicationRecord
  belongs_to :station, optional: true
end
