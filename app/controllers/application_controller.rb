class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :authenticate_user!
  before_action :request_url

  ENV['ACCEPT_LANGUAGE'] = 'ja'

  rescue_from StandardError, with: :rescue500

  private

  def request_url
    session[:previous_url] = request.referer
  end

  def rescue500(e)
    render "errors/internal_server_error", status: 500
  end
end
