class AddTicketRefToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :ticket, index: true, foreign_key: true
  end
end
