class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :content
      t.string :status
      t.string :priority
      t.datetime :beginning_date
      t.datetime :ending_date
<<<<<<< HEAD
=======

>>>>>>> 0092248665927e8253602191d6718d14e42f6bc0
      t.timestamps
    end
  end
end
