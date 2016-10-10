class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      #validations user, title, description, private_flag, deadline, start_date, completed
      t.integer :user_id, null: false
      t.string :title, null: false
      t.date :start_date, null: false
      t.text :description
      t.string :private_flag, null: false, default: "false"
      t.string :completed, null: false, default: "false"
      t.date :deadline

      t.timestamps null: false
    end
  end
end
