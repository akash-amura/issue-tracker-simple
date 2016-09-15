class AddRememberDigestToUser < ActiveRecord::Migration
  def change
    add_column :users, :rememeber_digest, :string
  end
end
