class Room < ApplicationRecord
  belongs_to :user

  has_one_attached :image_name

  validates :name, presence: true
  validates :introduction, presence: true
  validates :single_rate, presence: true
  validates :address, presence: true
  validates :image_name, presence: true
  validates :user_id, presence: true
end
