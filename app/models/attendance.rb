class Attendance < ApplicationRecord
  belongs_to :schedule
  belongs_to :schedule_share
end
