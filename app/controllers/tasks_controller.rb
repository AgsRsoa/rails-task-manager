class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(tasks_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

private

# We cannot save data without using Strong Params:

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
