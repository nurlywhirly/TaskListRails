class TasksController < ApplicationController
  before_action :logged_in?, except: [:update, :create]
  before_action :find_task, except: [:index, :new, :create]

  def index
    @task_list = user_tasks_only(Task.all)
  end

  def show; end

  ##### NEW CREATE #############################################
  def new
    @task = Task.new
  end

  def create
    if (@task = Task.create(task_params))
      @task.user_id = session[:user_id]
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

  def logged_in?
    redirect_to login_path if session[:user_id].nil?
  end

  def find_task
    @task = Task.find(params[:id])
  end

end
