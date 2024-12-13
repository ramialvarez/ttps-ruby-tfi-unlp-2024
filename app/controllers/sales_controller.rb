class SalesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @sales = Sale.page(params[:page]).per(1)
  end

  def show 
    @sale = Sale.find(params[:id]) 
    @items = SaleItem.where(sale_id: @sale.id)  
  end

  def new
    @sale = Sale.new
    @products = @products = Product.where("stock > ?", 0)
  end
  
  def create
    @sale = Sale.new(sale_params)
    @sale.user = current_user
    
    sale_items_data = params[:sale][:sale_items] ? JSON.parse(params[:sale][:sale_items]) : []
    
    puts "SALE ITEMS DATA: #{sale_items_data.inspect}"
  
    @sale.total = sale_items_data.sum { |item| 
      item['sale_price'].to_f * item['quantity'].to_i 
    }
  
    if @sale.save
      # Crear los items de venta
      sale_items_data.each do |item|
        puts "Processing item: #{item.inspect}"
        
        product = Product.find(item['product_id'])
        
        # Crear el item de venta
        @sale.sale_items.create!(
          product: product,
          quantity: item['quantity'],
          sale_price: product.unit_price
        )
  
        # Actualizar el stock del producto
        product.update(stock: product.stock - item['quantity'].to_i)
      end
      
      # Redirect to index or a specific path
      redirect_to sales_path, notice: 'Venta creada exitosamente.'
    else
      @products = Product.where("stock > ?", 0)
      render :new
    end
  end
  
  def destroy
    @sale = Sale.find(params[:id]) 
    @items = SaleItem.where(sale_id: @sale.id)  

    @items.each do |item|

        product = Product.find(item['product_id'])
        product.update(stock: product.stock + item['quantity'].to_i)
    end

    @sale.update(is_delete: false)

    redirect_to sales_path, notice: 'Venta eliminada exitosamente.'
  end

  private

  def sale_params
    params.require(:sale).permit(:total, sale_items: [:product_id, :quantity, :sale_price])
  end
end