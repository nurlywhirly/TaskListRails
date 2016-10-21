class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.string :name
      t.string :description
      t.date :completed

      t.timestamps null: false
    end
  end
end
