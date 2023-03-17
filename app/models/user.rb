class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  before_create :generate_membership_id

  # membership_idを生成するメソッド
  def generate_membership_id
    loop do
      self.membership_id = SecureRandom.random_number(10**5).to_s.rjust(5, "0")
      break unless User.exists?(membership_id: membership_id)
    end
  end
end