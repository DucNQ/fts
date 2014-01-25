class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :admin
      t.string :remember_token

      t.timestamps
    end
    
    change_column_default :users, :admin, 0
    add_index :users, :remember_token
  end
end
