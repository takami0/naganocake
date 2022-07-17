class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  #enum name: {cake: 0, pudding: 1, baked: 2, candy: 3}
end
