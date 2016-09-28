class TasksController < ApplicationController
  def index
    @task_list = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new; end

  def create
    Task.create({name: params[:name], description: params[:description], completed_at:params[:date]})
    redirect_to root_path
  end

  def destroy
  end

end
