class ListsController < ApplicationController
  before_action :set_list
  before_action :set_list, only: [:show]
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
  def list_params
    params.require(:list).permit!
  end
end
