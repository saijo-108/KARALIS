# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    if sign_in(resource_name, resource)
      flash[:notice] = "ログインしました"
      redirect_to lists_path
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def failed
    flash[:alert] = "メールアドレスまたはパスワードが違います"
    redirect_to root_path
  end

  protected

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#failed" }
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
