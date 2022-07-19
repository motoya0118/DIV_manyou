class TasksController < ApplicationController
  before_action :set_task, only: %w[edit update show destroy]
  def index
    if params[:task].present?
      title = params[:task][:title]
      status = params[:task][:status]
      if title.present? && status.present?
        @tasks = Task.title_status(title,status)
      elsif title.present?
        @tasks = Task.title(title)
      elsif status.present?
        @tasks = Task.status(status)
      else
        @tasks = Task.created_at
      end
    elsif params[:sort_expired].nil?
      @tasks = Task.created_at
    else
      @tasks = Task.deadline
    end
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
    params.require(:task).permit(:title,:content,:deadline,:sort_expired,:created_at,:status)
  end

end
