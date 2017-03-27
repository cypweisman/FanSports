class ChangeDefaultDrafts < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:drafts, :open, true)
  end
end
