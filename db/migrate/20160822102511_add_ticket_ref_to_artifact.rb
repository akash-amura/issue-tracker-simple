class AddTicketRefToArtifact < ActiveRecord::Migration
  def change
    add_reference :artifacts, :ticket, index: true, foreign_key: true
  end
end
