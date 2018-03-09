class DashboardController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    @user = current_user
    @spaces = @user.spaces
    @my_bookings = @user.bookings
  end
end
