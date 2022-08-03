class TableGroupusersController < ApplicationController

  def create
    @groupuser = TableGroupuser.new(user_id: params[:user_id],group_id: params[:group_id])
    if @groupuser.save
      redirect_to groups_path, notice: 'グループに入りました'
    else
      @groups = Group.all
      render template: "groups/index"
    end
  end

  def destroy
    @groupuser = TableGroupuser.find(params[:id])
    @groupuser.destroy
    redirect_to groups_path, notice: 'グループを離脱しました'
  end
end
