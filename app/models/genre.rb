class Genre < ApplicationRecord
  # belongs_to
  #enum name: {cake: 0, pudding: 1, baked: 2, candy: 3}
end

# [["テキスト1" 1], ["テキスト2", 2], ..]

# rails c
# Genre.all.map {|genre| [genre.name, genre.id]}
#  [["ケーキ", 1], ["プリン", 2], ["焼き菓子", 3], ["キャンディ", 4]]

#<%= f.select :name, Genre.all.map { |genre| [genre.name, genre.id] } %>
