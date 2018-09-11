class TasksController < ApplicationController
  # before_action :set_task, only: [:create]
  before_action :set_list
 
  def new
    @task = Task.new
  end


  def create

    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to board_list_path(@list.board_id, @list)
    else
      render :new
    end
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
  
end
