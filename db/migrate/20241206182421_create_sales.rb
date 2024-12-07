class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.datetime :sale_datetime
      t.decimal :total
      t.references :user, null: false, foreign_key: true
      t.string :customer

      t.timestamps
    end
  end
end
