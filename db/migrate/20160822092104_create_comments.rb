class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.timestamp :date

      t.timestamps null: false
    end
  end
end
