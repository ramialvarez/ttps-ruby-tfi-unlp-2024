class SalePolicy < ApplicationPolicy
    def index?
        user.employee? || user.manager? || user.admin?
    end
  
    def show?
        index?
    end
  
    def create?
        user.employee? || user.manager? || user.admin?
    end
  
    def update?
        user.employee? || user.manager? || user.admin?
    end
  
    def destroy?
        user.employee? || user.manager? || user.admin?
    end
  end