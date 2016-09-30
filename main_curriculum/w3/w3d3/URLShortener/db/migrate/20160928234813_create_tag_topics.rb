class CreateTagTopics < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.timestamps
      t.string :topic, null: false
    end
  end
end
