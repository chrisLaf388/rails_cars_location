# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @record.user == @user
  end

  def edit?
    update?
  end

  def category?
    true
  end

  def destroy?
    @record.user == @user
  end

  def accept?
    @user == @record.car.user
  end

  def decline?
    @user == @record.car.user
  end

  def mine?
    true
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
