class ScheduleShare < ApplicationRecord
  belongs_to :schedule
  belongs_to :membership, class_name: "User"
end
