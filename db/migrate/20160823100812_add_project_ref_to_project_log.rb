class AddProjectRefToProjectLog < ActiveRecord::Migration
  def change
    add_reference :project_logs, :project, index: true, foreign_key: true
  end
end
