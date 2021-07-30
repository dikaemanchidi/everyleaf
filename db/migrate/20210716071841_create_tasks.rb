class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :content
      t.string :text

      t.timestamps
    end
  end
end
