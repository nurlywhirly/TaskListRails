class TasksController < ApplicationController
  def index
    @task_list = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new; end

  def create
    
    redirect_to tasks_path
  end

  def destroy

  end

end
