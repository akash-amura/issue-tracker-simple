class AddManagerRefToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :manager, index: true, foreign_key: true
  end
end
