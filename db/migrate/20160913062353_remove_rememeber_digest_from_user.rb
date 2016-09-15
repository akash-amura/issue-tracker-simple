class RemoveRememeberDigestFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :rememeber_digest
  end
end
