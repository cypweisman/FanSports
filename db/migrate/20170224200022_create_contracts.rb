class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.integer :team_id, null: false
      t.integer :player_id, null: false
      t.decimal :salary, null: false
      t.boolean :active, null: false

      t.timestamps null: false
    end
  end
end
