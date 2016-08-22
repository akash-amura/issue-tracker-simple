class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :planned_completion_date
      t.datetime :actual_completion_date
      t.timestamp :creation_date

      t.timestamps null: false
    end
  end
end
