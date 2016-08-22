class AddSizeToArtifacts < ActiveRecord::Migration
  def change
    add_column :artifacts, :size, :float
  end
end
