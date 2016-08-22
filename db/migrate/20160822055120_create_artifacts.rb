class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|
      t.string :title
      t.text :description
      t.string :version
      t.text :data

      t.timestamps null: false
    end
  end
end
