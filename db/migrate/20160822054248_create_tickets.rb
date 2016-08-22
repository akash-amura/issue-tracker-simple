class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.date :planned_completion_date
      t.timestamp :submission_date
      t.string :blog_url

      t.timestamps null: false
    end
  end
end
