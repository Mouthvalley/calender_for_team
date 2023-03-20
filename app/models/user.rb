class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :follower_relationships, foreign_key: :followed_id, class_name: "Relationship"
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :followed_relationships, foreign_key: :follower_id, class_name: "Relationship"
  has_many :followeds, through: :followed_relationships, source: :followed

  before_create :generate_membership_id
  # membership_idを生成するメソッド
  def generate_membership_id
    loop do
      self.membership_id = SecureRandom.random_number(10**5).to_s.rjust(5, "0")
      break unless User.exists?(membership_id: membership_id)
    end
  end
end