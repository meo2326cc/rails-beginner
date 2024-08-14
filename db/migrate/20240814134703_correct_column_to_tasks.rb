class CorrectColumnToTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :task_name, false
    change_column_null :tasks, :description, false
  end
end
