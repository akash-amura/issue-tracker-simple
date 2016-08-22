class CreateJoinTableTicketsProjects < ActiveRecord::Migration
  def change
    create_join_table :tickets, :projects do |t|
      #t.index [:ticket_id, :project_id]
      t.index [:project_id, :ticket_id]
    end
  end
end
