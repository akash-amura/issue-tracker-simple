class CreateProjectLogs < ActiveRecord::Migration
  def change
    create_table :project_logs do |t|
      t.date :date
      t.float :hours

      t.timestamps null: false
    end
  end
end
