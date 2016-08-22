class AddUserRefToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :creator, index: true, foreign_key: true
  end
end
