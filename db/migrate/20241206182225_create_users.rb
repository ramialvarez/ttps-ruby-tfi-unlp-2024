class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, null: false
      t.string :phone
      t.string :password
      t.string :original_password
      t.integer :role
      t.date :entry_date
      t.boolean :active

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
  
end
