class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :sales
    
    enum :role, { 
      Empleado: 0, 
      Gerente: 1, 
      Administrador: 2 
    }
  
    # Validations
    validates :username,  
        presence: { message: "El nombre de usuario no puede estar en blanco" },
        uniqueness: { message: "Este nombre de usuario ya se encuentra en uso" }

    validates :email, 
        presence: { message: "El correo electrónico no puede estar en blanco" },
        uniqueness: { message: "Este correo electrónico ya está registrado" },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true
    
    # Asegurar que esté en true por defecto al crear
    before_validation :set_default_active, on: :create

    def deactivate
      # Guardar el digest de la contraseña original
      self.update(active: false, original_password: self.password)
  
      # Cambiar la contraseña a un valor aleatorio
      new_password = SecureRandom.hex(10)
      self.update(password: new_password)  # Esto actualizará el password_digest
    end
  
    # Método para activar el usuario
    def activate
      # Restaurar el digest de la contraseña original
      self.update(active: true, password: self.original_password)
    end

    private

    def set_default_active
      self.active = true
    end

  end