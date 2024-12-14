class StorefrontController < ApplicationController
    
    def index
        # Iniciar con todos los productos
        @products = Product.where(deleted_at: nil).page(params[:page]).per(6)
    
        # Filtro por categorías (múltiples)
        if params[:category_ids].present?
          @products = @products.where(category_id: params[:category_ids])
        end
    
        # Filtro por sub-categorías (múltiples)
        if params[:sub_category_ids].present?
          @products = @products.where(sub_category_id: params[:sub_category_ids])
        end
    
        # Filtro por búsqueda (texto)
        if params[:search].present?
          search_term = "%#{params[:search].downcase}%"
          @products = @products.where("LOWER(name) LIKE ? OR LOWER(description) LIKE ?", search_term, search_term)
        end
        
        # Cargar categorías y sub-categorías para los filtros
        @categories = Category.all
        @sub_categories = SubCategory.all
    
        
      end
end
  