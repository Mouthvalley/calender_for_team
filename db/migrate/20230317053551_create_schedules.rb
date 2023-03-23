class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.datetime :schedule_date, null: false
      t.text :schedule_content, null: false
      t.datetime :published_at

      t.timestamps
    end
  end
end
