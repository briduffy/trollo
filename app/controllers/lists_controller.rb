class ListsController < ApplicationController
  before_action :set_board
<<<<<<< HEAD
  before_action :set_list, only[:show, :edit, :update, :destroy, :upgrade_priority, :downgrade_priority]
=======
  before_action :set_list, only: [:show, :edit, :update, :destroy, :upgrade_priority, :downgrade_priority]
>>>>>>> spell check
  
  def index
    @lists = @board.list
  end

  def show
  end

  def new
    @list = List.new
    render partial: "form"
  end

  def create
    priority_when_added(@board)

    #@list = @board.list.new(list_params)

    if @list.save
      redirect to board_list_path(@board, @list)
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @list.update(list_params)
      redirect_to board_list_path(@board, @list)
    else
      render :edit
    end
  end

  # when destroyed, check to see if the priority of the list is greater than the one deleted.
  # if yes, loop through and -1 from the priority of all items there after.
  def destroy
    @list.destroy
    @board.lists.each do |list|
      if list.priority > destroyed.priority
        list.priority = list.priority - 1
      else 
        redirect to board_list_path(@board, @list)
      end
      # if nothing needs to happen stay on the page?
    redirect_to board_path(@board)
  end
end

  def upgrade_priority
    list_down_priority = @board.lists.find_by(priority: @list.priority - 1)
    @list.update(priority: list_down_priority.priority)
    list_down_priority.update(priority: list_down_priority + 1)
  end

  def downgrade_priority
    list_down_priority = @board.lists.find_by(priority: @list.priority - 1)
    @list.update(priority: list_down_priority.priority)
    list_down_priority.update(priority: list_down_priority + 1)
  end

  private
    def set_board
     @board = Board.find(params[:board_id])
    end

    def set_list
      @list = @board.lists.find(param[:id])
    end

    def list_params
      params.require(:list).(:name)
    end
  end
