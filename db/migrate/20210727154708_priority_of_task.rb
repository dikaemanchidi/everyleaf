class PriorityOfTask < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :priority, :integer, default: '0'
  end

  def down
    change_column :tasks, :priority, :integer
  end
end
