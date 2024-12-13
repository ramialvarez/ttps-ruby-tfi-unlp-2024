class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_items, dependent: :destroy
  has_many :products, through: :sale_items

  # Validaciones
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_default_on_delete, on: :create

  private

  def set_default_on_delete
    self.is_delete = false
  end

end