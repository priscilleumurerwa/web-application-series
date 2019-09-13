class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :names
      t.string :email
      t.string :location
      t.date :beginning_date
      t.text :title
      t.date :ending_date

      t.timestamps
    end
  end
end
