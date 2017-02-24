class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.integer :rating, null: false
      t.integer :jersey
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
