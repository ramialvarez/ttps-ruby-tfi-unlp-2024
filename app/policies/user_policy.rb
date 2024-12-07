class UserPolicy < ApplicationPolicy
    def index?
      user.admin? || user.manager? || user.employee?
    end
  
    def show?
      index?
    end
  
    def create?
      return false if user.employee? # Los empleados no pueden crear usuarios
      return true if user.admin? # Los administradores pueden crear cualquier usuario
      user.manager? && !record.admin? # Los gerentes no pueden crear administradores
    end
  
    def update?
      return false if user.employee? # Los empleados no pueden modificar usuarios
      return true if user.admin? # Los administradores pueden modificar cualquier usuario
      user.manager? && !record.admin? # Los gerentes no pueden modificar administradores
    end
  
    def destroy?
      return false if user.employee? # Los empleados no pueden eliminar usuarios
      return true if user.admin? # Los administradores pueden eliminar cualquier usuario
      user.manager? && !record.admin? # Los gerentes no pueden eliminar administradores
    end
  end
  