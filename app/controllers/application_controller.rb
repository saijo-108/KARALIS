class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :authenticate_user!
  before_action :request_url

  ENV['ACCEPT_LANGUAGE'] = 'ja'

  private

  def request_url
    session[:previous_url] = request.referer
  end
end
