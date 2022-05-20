class ListGroupsController < ApplicationController
    before_action :set_list_group
    before_action :set_group
    def edit
        @list_id = List.where(user_id: current_user).map(&:id)
    end

    def update
        if @list_group.update(list_group_params)
            redirect_to @group
            flash[:success] = "共有リストを変更しました"
        else
            render :edit
            flash[:alert] = "リストを変更できませんでした"
        end
    end

    private

    def set_list_group
        @list_group = ListGroup.find(params[:id])
    end

    def set_group
        @group = Group.find(params[:group_id])
    end

    def list_group_params
        params.require(:list_group).permit(:id, :list_id)
    end
end
