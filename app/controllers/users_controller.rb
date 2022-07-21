class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :else_user, only: [:edit,:show]

  def index
    @users = User.all
  end
  def new
    redirect_to tasks_path, notice: 'ログイン中です'
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user), notice: 'ユーザー作成完了'
      session[:user_id] = @user.id
    else
      render :new
    end
  end
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_url(@user), notice: 'ユーザー編集完了'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'ユーザーを削除しました'
  end

  private

  def else_user
    redirect_to tasks_path , notice: '自身の情報以外は閲覧不可' unless current_user.id ==  params[:id].to_i
  end

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end
end
