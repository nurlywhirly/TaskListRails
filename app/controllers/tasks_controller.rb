class TasksController < ApplicationController
  def index
    @task_list = Task.all
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

    # if @task.update(task_params)
    #   @task.save
    #   redirect_to root_path
    # else
    #   render :edit
    # end

    redirect_to root_path
  end

  ##### EDIT UPDATE #############################################
  def edit      # like "new"
    @task = Task.find(params[:id])
  end

  def update     # actually does the update, like "create"
    @task = Task.find(params[:id])

    if @task.update(task_params)
      # @task.save
      redirect_to root_path
    else
      render :edit
    end
  end

  #####  DESTROY  ###############################################

  def destroy
    @task = Task.find(params[:id]).destroy
  end

  # def confirm_deletion      # Way A deletion method - create a confirm_deletion.html.erb with a link_to with method: :delete
  #   @task = Task.find(params[:id])
  # end

  ###################### PRIVATE ##############################

  private

  def task_params
    params.require(:task).permit(:name, :description, :completed_at)
    # params.require(:table_name).permit(:field_one, :field_two)
  end

end
