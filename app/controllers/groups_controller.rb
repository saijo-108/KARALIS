class GroupsController < ApplicationController
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
    end

    def update
    end

    def edit
    end

    def destroy
    end

    private

    def group_params
        params.require(:group).permit(:name, :description, :user_ids)
    end
end
