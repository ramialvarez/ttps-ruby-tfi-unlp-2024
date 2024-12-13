class UsersController < ApplicationController
    
    before_action :authenticate_user!, only: [:index, :show]  # Asegura que el usuario esté autenticado
    before_action :authorize_user, only: [:index, :show]  # Verifica si tiene el rol adecuado

    def index
      @users = User.page(params[:page]).per(1)
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
        @roles = current_user.role == "Administrador" ? User.roles.keys : User.roles.keys - ['admin']
    end

    def create
        @user = User.new(user_params)
        @roles = current_user.role == "Administrador" ? User.roles.keys : User.roles.keys - ['admin']
        
        if @user.save
          redirect_to users_path, notice: "Usuario creado correctamente"
        else
          render :new, status: :unprocessable_entity
        end
    end
    
    def edit
        @user = User.find(params[:id]) 
    end

    def update
        @user = User.find(params[:id])
          
        if @user.update(user_params_edit)
          redirect_to users_path, notice: 'Usuario actualizado exitosamente.'
        else
          render :edit
        end
    end
    
    def destroy

      @user = User.find(params[:id])
      if @user.destroy
        redirect_to users_path, notice: 'Usuario eliminado exitosamente'
      else
        redirect_to users_path, alert: 'No se pudo eliminar el usuario'
      end
    end

    def activate
      @user = User.find(params[:id])
      @user.activate
      redirect_to users_path, notice: 'Usuario activado exitosamente.'
    end
  
    def deactivate
      @user = User.find(params[:id])
      @user.deactivate
      redirect_to users_path, notice: 'Usuario desactivado exitosamente.'
    end
    
    private
      def user_params
        params.expect(user: [:username, :email, :phone, :original_password, :entry_date, :role])
      end
      
      def authorize_user
        unless current_user.role == "Administrador" || current_user.role ==  "Gerente"
          render file: "#{Rails.root}/public/403.html", status: :forbidden
        end
      end
end
  