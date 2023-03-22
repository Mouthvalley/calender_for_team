class ShareSchedule < ApplicationRecord
  #スケジュール共有機能：中間テーブル(多対多の関連付け)
  belongs_to :user, foreign_key: "user_memberships_id"
  belongs_to :schedule
end
