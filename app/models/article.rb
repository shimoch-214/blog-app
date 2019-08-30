class Article < ApplicationRecord
  validates :content, presence: true
  validates :title, presence: true
  mount_uploader :image, ImageUploader, if: :image?

  belongs_to :user
  has_many :comments, dependent: :destroy
end
