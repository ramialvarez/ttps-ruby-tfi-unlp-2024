class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :unit_price
      t.integer :stock
      t.references :category, null: false, foreign_key: true
      t.string :color
      t.string :size
      t.date :entry_date
      t.date :last_modified_date
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
