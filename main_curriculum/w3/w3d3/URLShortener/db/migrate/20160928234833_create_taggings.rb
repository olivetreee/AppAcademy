class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.timestamps
      t.integer :topic_id, null: false
      t.integer :url_id, null: false
    end
    add_index :taggings, :topic_id
    add_index :taggings, :url_id
  end
end
