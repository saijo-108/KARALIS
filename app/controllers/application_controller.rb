class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :authenticate_user!

  private

  def not_authenticated
    flash[:warning] = "ログインしてください"
    redirect_to root_path
  end
end
