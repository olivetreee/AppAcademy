class FixUsersUniqueness < ActiveRecord::Migration
  def change
    remove_column :users, :username
    add_column :users, :username, :string, null: false, default: "Guest"
    # add_index :users, :username, unique: true
  end
end
