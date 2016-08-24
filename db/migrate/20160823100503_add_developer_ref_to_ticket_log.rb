class AddDeveloperRefToTicketLog < ActiveRecord::Migration
  def change
    add_reference :ticket_logs, :developer, index: true, foreign_key: true
  end
end
