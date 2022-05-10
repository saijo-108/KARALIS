class GroupsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_group, only: [:edit, :update, :destroy, :join, :group_destroy]
    def index
        @groups = Group.all
    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            flash[:success] = "グループを作成しました"
            redirect_to groups_path
        else
            flash.now[:alert] = "グループが作成できませんでした"
            render :new
        end
    end

    def show
        @group = Group.find(params[:id])
        @members = @group.users
        @lists = List.all.includes(:user).order(created_at: :asc)
    end

    def update
    end

    def edit
    end

    def destroy
        @group.users.delete(current_user)
        redirect_to groups_path, success: "退会しました！"
    end

    def select
        @group = Group.find(params[:id])
        @members = @group.users
        @lists = List.all.includes(:user).order(created_at: :asc)
    end

    def join
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
        params.require(:group).permit(:name, :description, :user_ids)
    end

    def set_group
        @group = Group.find(params[:id])
    end
end
