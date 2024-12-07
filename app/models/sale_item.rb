class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  # Validaciones
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :sale_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end