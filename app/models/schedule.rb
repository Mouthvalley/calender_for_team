class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_shares, dependent: :destroy

  validates :schedule_date, presence: true
  validates :schedule_content, presence: true
end