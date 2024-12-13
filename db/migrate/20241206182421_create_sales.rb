class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.decimal :total
      t.references :user, null: false, foreign_key: true
      t.string :customer
      t.boolean :is_delete

      t.timestamps
    end
  end
end
