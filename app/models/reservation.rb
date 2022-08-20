class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :start_date, presence:true
  validates :end_date, presence:true
  validates :number_of_people, presence:true, numericality: {only_integer: true, greater_than: 0}

  validate :start_end_check
  validate :start_date_before_today

  def start_end_check
    if start_date.present? && end_date.present? && start_date >= end_date
      errors.add(:end_date, "は開始日より後の日付を入力してください")
    end
  end
  
  def start_date_before_today
    if start_date.present? && end_date.present? && start_date < Date.today
     errors.add(:start_date, "は今日以降の日付で選択してください")
    end 
  end
end
