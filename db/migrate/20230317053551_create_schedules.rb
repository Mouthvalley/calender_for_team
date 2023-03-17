class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.date :schedule_date
      t.text :schedule_content
      t.datetime :published_at

      t.timestamps
    end
  end
end
