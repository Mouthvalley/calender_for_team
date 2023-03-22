class CreateShareSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :share_schedules do |t|
      t.integer :user_memberships_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
