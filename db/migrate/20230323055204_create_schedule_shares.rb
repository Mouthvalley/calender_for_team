class CreateScheduleShares < ActiveRecord::Migration[6.1]
  def change
    create_table :schedule_shares do |t|
      t.references :schedule, null: false, foreign_key: true
      t.references :membership, null: false, foreign_key: true

      t.timestamps
    end
  end
end
