class Post < ApplicationRecord
  validates :title, length: { maximum: 10 }, presence: true
  validates :image, presence: true
end
