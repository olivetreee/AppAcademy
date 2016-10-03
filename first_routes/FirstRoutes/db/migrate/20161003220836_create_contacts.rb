class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
    add_index :contacts, :user_id
    add_index :contacts, [:name, :email], unique: true
  end
end
