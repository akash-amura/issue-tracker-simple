class DropTableProjectDevelopers < ActiveRecord::Migration
  def up
    drop_table :developers_projects
  end

  def down
     raise ActiveRecord::IrreversibleMigration
  end
end
