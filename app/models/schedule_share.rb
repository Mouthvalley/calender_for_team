class ScheduleShare < ApplicationRecord
  belongs_to :schedule
  belongs_to :user
  enum status: { not_attending: 0, attending: 1 }
  has_many :attendances
end
