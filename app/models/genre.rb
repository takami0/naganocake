class Genre < ApplicationRecord
  belongs_to
  enum name: {cake: 0, pudding: 1, baked: 2, candy: 3}
end
