class TasksController < ApplicationController
  before_action :set_task, only: %w[edit update show destroy]

  def index
    @timenear_task = current_user.tasks.where("deadline BETWEEN ? AND ?", Time.zone.today - 3, Time.zone.today)
    @timefails_task = current_user.tasks.where("deadline < ?", Time.zone.today)
    # start_date = params.fetch(:start_date, Date.today).to_date
    # @deadlines = Task.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week
    if params[:task].present?
      title = params[:task][:title]
      status = params[:task][:status]
      label_id = params[:task][:label_id]
      if title.present? && status.present?
        @tasks = current_user.tasks.title_status(title,status).page(params[:page])
      elsif label_id.present?
        @tasks = current_user.tasks.where(id: LabelChild.where(label_master_id: label_id).pluck(:task_id)).page(params[:page])
      elsif title.present?
        @tasks = current_user.tasks.title(title).page(params[:page])
      elsif status.present?e
        @tasks = current_user.tasks.status(status).page(params[:page])
      else
        @tasks = current_user.tasks.created_at.page(params[:page])
      end
    elsif params[:sort_expired].present?
      @tasks = current_user.tasks.deadline.page(params[:page])
    elsif params[:sort_priority].present?
      @tasks = current_user.tasks.priority.page(params[:page])
    else
      @tasks = current_user.tasks.created_at.page(params[:page])
    end
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
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
    unless @task.reads.find_by(user_id: current_user.id)
      @read = Read.new(user_id: current_user.id, task_id: params[:id])
      @read.save
    end

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
    params.require(:task).permit(
      :title,
      :content,
      :deadline,
      :sort_expired,
      :created_at,
      :status,:priority,
      :sort_priority,
      :page,:user_id,
      :label_id,
      :image,
      label_ids: [],
      label_childs_attributes: %w[name user_id]
    )
  end

end
