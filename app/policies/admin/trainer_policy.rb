module Admin
  class TrainerPolicy < ApplicationPolicy
    def index?
      user.admin?
    end

    def show?
      true
    end

    def create?
      user.admin?
    end

    def update?
      user.admin?
    end

    def destroy?
      user.admin?
    end

    def search?
      user.admin?
    end

    class Scope < ApplicationPolicy::Scope
      def resolve
        if user.admin?
          scope.all
        else
          scope.where(id: user.id)
        end
      end
    end
  end
end
