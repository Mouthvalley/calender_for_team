class AddTitleAndStartTimeToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :title, :string
    add_column :schedules, :start_time, :datetime
  end
end
