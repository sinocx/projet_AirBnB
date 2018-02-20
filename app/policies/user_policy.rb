class UserPolicy < ApplicationPolicy
  def show
    true
  end

  def new
   true
  end

  def create
   true
  end

  def update
    user == current_user
  end

  def edit
  user == current_user
  end

  def destroy
    user == current_user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
