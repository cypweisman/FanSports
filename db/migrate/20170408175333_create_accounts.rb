class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :account_name, null: false
      t.string :account_email, null: false
      t.string :password_hash, null: false

      t.timestamps null:false
    end
  end
end
