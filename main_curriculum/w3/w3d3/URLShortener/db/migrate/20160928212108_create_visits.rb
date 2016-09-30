class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :visitor_id, null: false
      t.integer :short_url_id, null: false
      t.timestamps
    end

    add_index :visits, :visitor_id
    add_index :visits, :short_url_id
  end
end
