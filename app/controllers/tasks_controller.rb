class TasksController < ApplicationController
  before_action :set_list
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  
  end

  def create
    @task = @list.task.new(task_params)
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

  def task_params
    params.require(:tast).permit(:name)
  end
  
end
