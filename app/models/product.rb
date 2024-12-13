class Product < ApplicationRecord
  belongs_to :category
  belongs_to :color, optional: true
  has_many :sale_items
  has_many :sales, through: :sale_items
  belongs_to :sub_category
  has_many_attached :images

  # Validaciones
  validates :name,
        presence: { message: "El nombre del producto no puede estar en blanco" }
  
  validates :unit_price, 
        presence: { message: "El precio no puede estar en blanco" },
        numericality: { greater_than_or_equal_to: 0, message: "El precio debe ser mayor a 0"}

  validates :stock, 
        presence: { message: "El stock no puede estar en blanco" },
        numericality: { greater_than_or_equal_to: 0, message: "El stock debe ser mayor a 0"}

  def soft_delete
    update(deleted_at: Time.current, stock: 0)
  end

  def name_with_details
      "#{name} - $#{unit_price} (Stock: #{stock})"
  end



end