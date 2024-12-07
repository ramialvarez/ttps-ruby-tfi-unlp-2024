class Product < ApplicationRecord
  belongs_to :category
  has_many :sale_items
  has_many :sales, through: :sale_items

  # Validaciones
  validates :name, presence: true
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { greater_than_or_equal_to: 0 }
end