class DashboardPolicy < ApplicationPolicy
  def rental
     record.user == user
  end

  def offer
     record.user == user
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
