class AddUserRefToTicket < ActiveRecord::Migration
  def change
    add_reference :tickets, :owner, index: true, foreign_key: true
  end
end
