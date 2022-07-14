class Item < ApplicationRecord
  has_one_atacched :image
  has_many :genres, dependent: :destroy
  
  def get_image(width, height)
　unless image.attached?
　　file_path = Rails.root.join("app/assets/images/no_image.jpeg")
　　image.attach(io: File.open(file_path), filename: "no_image.jpeg", content_type: "image/jpeg")
　end
　image.variant(resize_to_limit: [width, height]).processed
  end
  
end
