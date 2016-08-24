class AddTicketRefToTicketLogs < ActiveRecord::Migration
  def change
    add_reference :ticket_logs, :ticket, index: true, foreign_key: true
  end
end
