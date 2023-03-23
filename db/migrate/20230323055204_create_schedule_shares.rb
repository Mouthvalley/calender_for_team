class CreateScheduleShares < ActiveRecord::Migration[6.1]
  def change
    create_table :schedule_shares do |t|
      t.integer "schedule_id", null: false
      t.integer "user_id", null: false

      t.timestamps
    end
  end
end
