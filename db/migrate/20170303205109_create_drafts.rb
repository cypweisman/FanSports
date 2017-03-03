class CreateDrafts < ActiveRecord::Migration[5.0]
  def change
    create_table :drafts do |t|
      t.integer :number_of_rounds, null: false

      t.timestamps null: false
    end
  end
end
