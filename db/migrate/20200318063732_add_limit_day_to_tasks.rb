class AddLimitDayToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :limit_day, :datetime
  end
end
