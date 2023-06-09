class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  def full_name
    "#{last_name}#{first_name}"
  end

  #membership_idを生成するメソッド
  before_create :generate_membership_id
  def generate_membership_id
    loop do
      self.membership_id = SecureRandom.random_number(10**5).to_s.rjust(5, "0")
      break unless User.exists?(membership_id: membership_id)
    end
  end

  #フォロー機能
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  def follow(user)
    followings << user
  end
  def unfollow(user)
    followings.delete(user)
  end
  def following?(user)
    followings.include?(user)
  end

  #スケジュール共有
  has_many :schedules, dependent: :destroy
  has_many :schedule_shares, dependent: :destroy
  has_many :shared_schedules, through: :schedule_shares, source: :schedule
end

