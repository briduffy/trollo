
class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  
  def index
    @lists = @board.lists
  end

  def show
  end

  def new
    #@list = Board.lists.new(list_params)
    @list = List.new
    render partial: "form"
  end

  def create
    # List.priority_when_added(@board)

    @list = @board.lists.new(list_params)

    if @list.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @list.update(list_params)
      redirect_to board_path(@board)
    else
      render :edit
    end
  end

  # when destroyed, check to see if the priority of the list is greater than the one deleted.
  # if yes, loop through and -1 from the priority of all items there after.

  def destroy
    @list.destroy
    #@board.lists.each do |list|
    #  if list.priority > destroyed.priority
    #    list.priority = list.priority - 1
      if 
        redirect to board_path(@board, @list)
      else
      # if nothing needs to happen stay on the page?
        redirect_to board_path(@board)
      end 
  end

  #def upgrade_priority
  #  list_down_priority = @board.lists.find_by(priority: @list.priority - 1)
  #  @list.update(priority: list_down_priority.priority)
  #  list_down_priority.update(priority: list_down_priority + 1)

    #redirect path?
  #end

  #def downgrade_priority
  #  list_down_priority = @board.lists.find_by(priority: @list.priority - 1)
  #  @list.update(priority: list_down_priority.priority)
  #  list_down_priority.update(priority: list_down_priority + 1)

    #redirect path?
  #end

  private
    def set_board
     @board = Board.find(params[:board_id])
    end

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
  end