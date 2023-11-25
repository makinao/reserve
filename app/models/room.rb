class Room < ApplicationRecord
  mount_uploader :home_image, HomeImageUploader
  validates :name, presence: true
  validates :content, presence: true
  validates :address, presence: true
  validates :money, presence: true
end
