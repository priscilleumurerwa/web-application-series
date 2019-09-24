class ChangeColumnNullTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :name, :string, null: false
   change_column :tasks, :content, :text, null: false
   change_column :tasks, :status, :string, null: false
   change_column :tasks, :priority, :string, null: false
   change_column :tasks, :beginning_date, :date, null: false
   change_column :tasks, :ending_date, :date, null: false
  end
end
