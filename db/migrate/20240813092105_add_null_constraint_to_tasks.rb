class AddNullConstraintToTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :task_name, null: false
    change_column_null :tasks, :description, null: false
  end
end
