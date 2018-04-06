class DashboardController < ApplicationController
  before_action :redirect_as_per_user_role, only: [:home]

  def home;end

  private

  def redirect_as_per_user_role
    if user_signed_in?
      if current_user.has_role?(:admin)
        redirect_to admin_users_path
      elsif current_user.has_role?(:faculty)
        redirect_to assignments_path
      elsif current_user.has_role?(:student)
        redirect_to admin_users_path
      end
    else
      return true
    end
  end

end
