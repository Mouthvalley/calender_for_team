class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.datetime :schedule_date
      t.text :schedule_content
      t.datetime :published_at

      t.timestamps
    end
  end
end
