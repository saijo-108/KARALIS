class ListsController < ApplicationController
  before_action :authenticate_user!

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.save
    redirect_to lists_path
  end

  def index
    @lists = List.all.includes(:user).order(created_at: :desc)
  end

  def show
    @list = List.find(params[:id])
    @user = @list.user
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
