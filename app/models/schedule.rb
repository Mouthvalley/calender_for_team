class Schedule < ApplicationRecord
  has_many :schedule_shares, dependent: :destroy
  has_many :shared_users, through: :schedule_shares, source: :user
end
