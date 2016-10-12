class ChangeSubColumnName < ActiveRecord::Migration
  def change
    rename_column :subs, :moderator, :moderator_id
  end
end
