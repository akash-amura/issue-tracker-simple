class AddRememberDigestToUser2 < ActiveRecord::Migration
  def change
    add_column :users, :remember_digest, :string
  end
end
