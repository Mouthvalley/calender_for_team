class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_shares, dependent: :destroy
end
