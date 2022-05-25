class GroupsController < ApplicationController
    before_action :authenticate_user!, except: [:select]
    before_action :set_group, only: [:edit, :update, :destroy, :join, :group_destroy, :member_destroy]

    def index
        @groups = Group.all
        @user = GroupUser.where(user_id: current_user)
    end

    def new
        @group = Group.new
        @select_list = List.new
    end

    def create
        @select_list = List.new
        @group = Group.new(group_params)
        @list_id = List.where(user_id: current_user).map(&:id)
        if @list_id.present?
          @list = List.find(list_params["id"])
          @group.add_list_groups(@list)
        end
        if @group.save
            flash[:success] = "グループを作成しました"
            redirect_to groups_path
        else
            render :new
        end
    end

    def show
        @group = Group.find(params[:id])
        @members = @group.users
        @lists = List.all.includes(:user).order(created_at: :asc)
        @list = @group.lists
        @my_list =  @list.find{|n| n.user_id == current_user.id }
        unless @members.any? { |m| m.id == current_user.id}
            redirect_to  select_group_path(@group)
        end
        @group_user = GroupUser.where(group_id: @group.id)
        if @members.any?
            @leader = GroupUser.find_by(group_id: @group)
        end
        @times = GroupUser.where(group_id: params[:id])
    end

    def update
        if @group.update(group_params)
            redirect_to @group
            flash[:success] = "グループ名を変更しました"
        else
            render :edit
        end
    end

    def edit
    end

    def destroy
        @list_id = List.where(user_id: current_user).map(&:id)
        @found_list = ListGroup.where(list_id: @list_id).where(group_id: @group.id)
        @found_list.destroy_all
        @group.users.delete(current_user)
        redirect_to groups_path, success: "退会しました！"
    end

    def select
        @group = Group.find(params[:id])
        @members = @group.users
        @list_names = List.where(user_id: current_user).map(&:name)
        @list_id = List.where(user_id: current_user).map(&:id)
        @select_list = List.new
    end

    def join
        @list_id = List.where(user_id: current_user).map(&:id)
        if @list_id.present?
          @list = List.find(list_params["id"])
          @group.lists << @list
        end
        @group.users << current_user
        if @group.save
            redirect_to group_path
            flash[:success] = "グループに参加しました"
        else
            redirect_to group_path
            flash[:success] = "エラーが発生しました"
        end
    end

    def group_destroy
        @group.destroy!
        redirect_to groups_path, success: "グループを削除しました！"
    end

    private

    def group_params
        params.require(:group).permit(:name, :description, :user_ids, :list_ids)
    end

    def set_group
        @group = Group.find(params[:id])
    end

    def list_params
        params.require(:list).permit(:id)
    end
    
end
