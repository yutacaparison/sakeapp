class Blog < ApplicationRecord

  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 42 }
  validates :content, presence: true

end
