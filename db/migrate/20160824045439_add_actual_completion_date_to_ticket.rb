class AddActualCompletionDateToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :actual_completion_date, :date
  end
end
