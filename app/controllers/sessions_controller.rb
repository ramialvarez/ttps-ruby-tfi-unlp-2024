class SessionsController < Devise::SessionsController
    def create
        self.resource = warden.authenticate!(auth_options)
        
        # Verificaciones personalizadas
        if resource.nil?
          flash[:alert] = "Credenciales inválidas"
          redirect_to new_user_session_path
        elsif !resource.active?
          flash[:alert] = "Tu cuenta está desactivada"
          redirect_to new_user_session_path
        else
          set_flash_message!(:notice, :signed_in)
          sign_in(resource_name, resource)
          yield resource if block_given?
          redirect_to root_path
        end
      end
  end