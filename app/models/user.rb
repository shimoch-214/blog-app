class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :email, presence: true
  mount_uploader :ano, AnoUploader, if: :ano?

  has_many :articles
  has_many :comments
end
