class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :phone
      t.string :password_digest
      t.integer :role, default: 0
      t.date :entry_date
      t.boolean :active, default:true

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
