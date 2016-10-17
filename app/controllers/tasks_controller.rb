class TasksController < ApplicationController
  def index
    if session[:user_id].nil?
      redirect_to login_path
      return
    else
      @task_list = Task.all
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  ##### NEW CREATE #############################################
  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  ##### EDIT UPDATE #############################################
  def edit      # like "new"
    @task = Task.find(params[:id])
  end

  def update     # actually does the update, like "create"
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.completed_at = Date.today
    @task.save
    redirect_to root_path
  end

  #####  DESTROY  ###############################################
  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  ###################### PRIVATE ##############################

  private

  def task_params
    params.require(:task).permit(:name, :description, :completed_at)
    # params.require(:table_name).permit(:field_one, :field_two)
  end

end
