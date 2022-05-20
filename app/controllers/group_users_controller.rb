class GroupUsersController < ApplicationController
    def destroy
        @group = Group.find(params[:group_id])
        @group_user = GroupUser.find_by(id: params[:id],group_id: params[:group_id])
        @list_id = List.where(user_id: @group_user.user_id).map(&:id)
        @found_list = ListGroup.where(list_id: @list_id).where(group_id: @group.id)
        @group_user.destroy!
        @found_list.destroy_all
        binding.pry
        redirect_to group_path(@group), success: "ユーザーを削除しました"
    end
end
