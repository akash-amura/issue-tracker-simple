class CreateTicketLogs < ActiveRecord::Migration
  def change
    create_table :ticket_logs do |t|
      t.date :date
      t.float :hours

      t.timestamps null: false
    end
  end
end
