class CreateToysTable < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name, null: false
      t.references :toyable, polymorphic: true, index: true
    end
    add_index :toys, :name, unique: true
    add_index :toys, :toyable_id
  end
end
