class TasksController < ApplicationController
  def index
    @task_list = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  def edit      # like "new"
    @task = Task.find(params[:id])
  end

  def update     # actually does the update, like "create"
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completed_at)
    # params.require(:table_name).permit(:field_one, :field_two)
  end

end
