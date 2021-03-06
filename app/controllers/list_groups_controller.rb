class ListGroupsController < ApplicationController
  before_action :set_list_group, only: %i[edit update]
  before_action :set_group
  before_action :set_have_list, only: %i[new edit]

  def new
    @list_group = ListGroup.new
  end

  def create
    @list_group = ListGroup.new(new_list_group_params)
    if @list_group.save
      redirect_to group_path(@group)
      flash[:success] = '共有リストを登録しました'
    else
      flash.now['alert'] = 'リストが登録できませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @list_group.update(list_group_params)
      redirect_to @group
      flash[:success] = '共有リストを変更しました'
    else
      flash.now['alert'] = 'リストが変更できませんでした'
      render :edit
    end
  end

  private

  def set_list_group
    @list_group = ListGroup.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_have_list
    @list_id = List.where(user_id: current_user)
  end

  def list_group_params
    params.require(:list_group).permit(:id, :list_id)
  end

  def new_list_group_params
    params.require(:list_group).permit(:group_id, :list_id)
  end
end
