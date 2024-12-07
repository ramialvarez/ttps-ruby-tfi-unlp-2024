class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_items, dependent: :destroy
  has_many :products, through: :sale_items

  # Validaciones
  validates :sale_datetime, presence: true
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
end