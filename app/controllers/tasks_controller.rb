class TasksController < ApplicationController
  def index
    @query = Task.ransack(params[:q])
    @tasks = @query.result(distinct: true)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to root_path, notice: "タスク「#{@task.title}」を登録しました"
    else
      render action: :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to root_path, notice: "タスク「#{@task.title}」を編集しました"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path, notice: "タスク「#{task.title}」を削除しました"
  end

private

  def task_params
    params[:task].permit(:title, :description, :limit_day, :status)
  end

end
