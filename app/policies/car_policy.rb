class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def accept
      raise
    end

    def resolve
      scope.all
    end
  end
end
