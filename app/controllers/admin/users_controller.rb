class Admin::UsersController < ApplicationController
  before_action :admin_permission
  def index
    @users = User.includes(:tasks)
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'ユーザーを作成しました'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'ユーザーを編集しました'
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーを削除しました'
  end

  private
  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation,:permission)
  end
  def admin_permission
    redirect_to tasks_path, notice: 'Admin権限がありません' unless current_user.permission
  end
end
