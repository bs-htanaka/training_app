class TasksController < ApplicationController
  PER = 3
  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = current_user.tasks.page(params[:page]).per(PER)
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))
    if @task.save
      redirect_to root_path, notice: "タスク「#{@task.title}」を登録しました"
    else
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to root_path, notice: "タスク「#{@task.title}」を編集しました"
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to root_path, notice: "タスク「#{task.title}」を削除しました"
  end

private

  def task_params
    params[:task].permit(:title, :description, :limit_day, :status,:priority)
  end

end
