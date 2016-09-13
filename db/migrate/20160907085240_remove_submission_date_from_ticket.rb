class RemoveSubmissionDateFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :submission_date
  end
end
