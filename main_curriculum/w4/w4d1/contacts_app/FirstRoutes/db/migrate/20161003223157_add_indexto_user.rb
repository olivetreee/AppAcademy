class AddIndextoUser < ActiveRecord::Migration
  def change
    add_index :users, :username, unique: true
  end
end
