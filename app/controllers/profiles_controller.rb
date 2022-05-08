class ProfilesController < ApplicationController
before_action :set_user, only: %i[edit update]
  
  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "変更しました"
      redirect_to profile_path
    else
      flash[:alert] = "変更できませんでした"
      redirect_to edit_profile_path
    end
  end

  def show; end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
