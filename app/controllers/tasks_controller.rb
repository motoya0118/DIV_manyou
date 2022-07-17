class TasksController < ApplicationController
  before_action :set_task, only: %w[edit update show destroy]
  def index
    @tasks = Task.all.order(created_at: "DESC")
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path , notice: "登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path , notice: "編集しました"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: "削除しました"
    else
      render :index
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title,:content)
  end

end
