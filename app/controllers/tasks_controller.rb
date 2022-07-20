class TasksController < ApplicationController
  before_action :set_task, only: %w[edit update show destroy]
  def index
    if params[:task].present?
      title = params[:task][:title]
      status = params[:task][:status]
      if title.present? && status.present?
        @tasks = Task.title_status(title,status).page(params[:page])
      elsif title.present?
        @tasks = Task.title(title).page(params[:page])
      elsif status.present?
        @tasks = Task.status(status).page(params[:page])
      else
        @tasks = Task.created_at.page(params[:page])
      end
    elsif params[:sort_expired].present?
      @tasks = Task.deadline.page(params[:page])
    elsif params[:sort_priority].present?
      @tasks = Task.priority.page(params[:page])
    else
      @tasks = Task.created_at.page(params[:page])
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
    params.require(:task).permit(:title,:content,:deadline,:sort_expired,:created_at,:status,:priority,:sort_priority,:page)
  end

end
