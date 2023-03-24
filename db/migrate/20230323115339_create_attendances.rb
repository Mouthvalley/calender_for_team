class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.integer "schedule_id", null: false
      t.integer "user_id", null: false
      t.boolean "status", null: false, default: true

      t.timestamps
    end
  end
end
