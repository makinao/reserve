class Room < ApplicationRecord
  has_many :reservations, dependent: :destroy
  mount_uploader :home_image, HomeImageUploader
  validates :name, presence: true
  validates :content, presence: true
  validates :address, presence: true
  validates :money, presence: true
  validates :money, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
end