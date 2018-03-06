class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  # Add exceptions to above line - Ie: ', only: :home'
  def home
  end
end
