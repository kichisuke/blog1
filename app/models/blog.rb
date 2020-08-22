class Blog < ApplicationRecord
  has_rich_text :content
  has_many :likes, dependent: :destroy
end
