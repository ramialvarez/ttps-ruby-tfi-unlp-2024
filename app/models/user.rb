class User < ApplicationRecord
    has_many :sales
    

    # Enum with prefix and suffix
    enum :role, { 
      employee: 0, 
      manager: 1, 
      admin: 2 
    }
  
    # Validations
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, 
                    uniqueness: true, 
                    format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true
  
    # Autenticación (usando has_secure_password)
    has_secure_password
  end