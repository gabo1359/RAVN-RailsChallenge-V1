class CatchPolicy < ApplicationPolicy
  def index?
    user.trainer?
  end

  def create?
    user.trainer?
  end
end
