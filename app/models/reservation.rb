class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :people, presence: true
  validates :people, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  
      def sum_of_price
        (room.money * people).to_i
      end
end
