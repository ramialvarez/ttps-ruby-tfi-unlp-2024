class ProductsController < ApplicationController
    
  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destroy]

    def index
        @products = Product.where(deleted_at: nil).page(params[:page]).per(2)
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
        @categories = Category.all
        @colors = Color.all
        @sub_categories = SubCategory.all
    end

    def create
        @product = Product.new(product_params)
        @categories = Category.all
        @colors = Color.all
        @sub_categories = SubCategory.all

        if @product.save
          redirect_to products_path, notice: "Producto creado correctamente"
        else
          render :new, status: :unprocessable_entity
        end
    end
    
    def edit
        @product = Product.find(params[:id]) 
        @categories = Category.all
        @colors = Color.all
        @sub_categories = SubCategory.all
    end

    def update
        @product = Product.find(params[:id])
        @categories = Category.all
        @colors = Color.all
        @sub_categories = SubCategory.all

        if @product.update(product_params)
          redirect_to products_path, notice: 'Producto actualizado exitosamente.'
        else
          render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy

      @product = Product.find(params[:id])
      if @product.soft_delete
        redirect_to products_path, notice: 'Producto eliminado exitosamente'
      else
        redirect_to products_path, alert: 'No se pudo eliminar el usuario'
      end
    end
    
    private
      def product_params
        params.require(:product).permit(
          :name, :description, :unit_price, :stock, :color_id, :size, :entry_date, :category_id, :sub_category_id, images: []
        )
      end
      
end
  