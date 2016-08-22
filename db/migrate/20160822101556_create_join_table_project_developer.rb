class CreateJoinTableProjectDeveloper < ActiveRecord::Migration
  def change
    create_join_table :projects, :developers do |t|
      t.index [:project_id, :developer_id]
      # t.index [:developer_id, :project_id]
    end
  end
end
