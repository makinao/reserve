class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :people, presence: true
  validates :people, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validate :start_end_check
    
    def start_finish_check
        if start_date.present? && end_date.present? && start_date > end_date
         errors.add(:end_date, "はチェックインより前の日付は登録できません") 
        end
      end

      def sum_of_price
        (room.money * people).to_i
      end
end
