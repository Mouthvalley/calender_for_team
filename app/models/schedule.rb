class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_shares, dependent: :destroy
  has_many :shared_users, through: :schedule_shares, source: :user
  
  def shared_with?(user)
    shared_users.include?(user)
  end
end
