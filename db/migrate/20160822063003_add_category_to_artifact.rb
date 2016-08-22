class AddCategoryToArtifact < ActiveRecord::Migration
  def change
    add_column :artifacts, :category, :integer
  end
end
