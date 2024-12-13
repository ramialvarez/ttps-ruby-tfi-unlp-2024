# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]
  
  def new
    # No iniciar sesión automáticamente
    @user = User.new
    @roles = current_user.role == "Administrador" ? User.roles.keys : User.roles.keys - ['Administrador']
  end

  def create

    @roles = current_user.role == "Administrador" ? User.roles.keys : User.roles.keys - ['Administrador']
    # Depuración de parámetros recibidos
    Rails.logger.debug "Params received: #{params.inspect}"

    # Construye el recurso con los parámetros de sign up
    @user = build_resource(sign_up_params)

    resource.errors.delete(:email)
    
    if resource.valid?
      # Validación y guardado del recurso
      if resource.save
        # NO iniciar sesión automáticamente
        # Puedes agregar un mensaje de éxito en el flash
        flash[:notice] = "Usuario creado exitosamente. Por favor inicie sesión."
        
        # Redirigir al inicio de sesión o a donde prefieras
        redirect_to new_user_session_path
      else
        # Agregamos un mensaje de error más específico
        set_flash_message! :alert, :save_error
        flash.now[:alert] = "No se pudo crear el usuario. Por favor, revise los errores."
        clean_up_passwords resource
        set_minimum_password_length
        render :new
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def edit
    # Obtén el usuario que está autenticado
    @user = current_user
  end

  def update
    # Obtén el usuario que está autenticado
    @user = current_user
    
    # Actualiza el recurso con los parámetros recibidos
    if @user.update(update_params)
      # Si la actualización es exitosa, muestra un mensaje de éxito
      sign_in(@user)
      flash[:notice] = "Los detalles de tu cuenta se han actualizado correctamente."
      redirect_to root_path
    else
      # Si la actualización falla, muestra los errores
      flash.now[:alert] = "No se pudo actualizar tu cuenta. Por favor, revisa los errores."
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :phone, :entry_date, :role)
  end

  def update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :phone)
  end
end