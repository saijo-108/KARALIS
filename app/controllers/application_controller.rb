class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :authenticate_user!


  ENV['ACCEPT_LANGUAGE'] = "ja"

  private


  def after_sign_in_path_for(resource) 
    lists_path
  end

end
