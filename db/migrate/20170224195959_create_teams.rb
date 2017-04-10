class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :owner, null: false
      t.integer :account_id, null: false

      t.timestamps null: false
    end
  end
end
