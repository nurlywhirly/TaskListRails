class TasksController < ApplicationController
  skip_before_action :logged_in?, only: [:update, :create]
  before_action :find_task, except: [:index, :new, :create]

  def index
    tasks = Task.all.where(user_id: session[:user_id])

    @completed_tasks = tasks.where.not(completed_at: nil)
    @incompleted_tasks = tasks.where(completed_at: nil)
  end

  def show; end

  ##### NEW CREATE #############################################
  def new
    @task = Task.new
  end

  def create
    if (@task = Task.create(task_params))
      @task.user_id = session[:user_id]
      @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  ##### EDIT UPDATE #############################################
  def edit; end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def complete
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
    params.require(:task).permit(:name, :description, :completed_at, :user_id)
    # params.require(:table_name).permit(:field_one, :field_two)
  end

  def find_task
    @task = Task.find(params[:id])
  end

end
