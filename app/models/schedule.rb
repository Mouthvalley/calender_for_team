class Schedule < ApplicationRecord
  #スケジュール共有機能
  has_many :share_schedules, dependent: :destroy
  has_many :users, through: :share_schedules
end
