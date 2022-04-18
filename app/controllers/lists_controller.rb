class ListsController < ApplicationController
  before_action :authenticate_user!

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to lists_path
      flash[:success] = "リストを作成しました"
    else
      flash.now['alert'] = " リストが作成できませんでした"
      render :new
    end
  end

  def index
    @lists = List.all.includes(:user).order(created_at: :asc)
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
