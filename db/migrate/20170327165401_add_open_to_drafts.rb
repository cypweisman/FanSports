class AddOpenToDrafts < ActiveRecord::Migration[5.0]
  def change
    add_column :drafts, :open, :boolean
  end
end
