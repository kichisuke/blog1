class Blog < ApplicationRecord
  has_rich_text :content
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :media, MediaUploader

end
