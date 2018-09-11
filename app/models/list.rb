class List < ApplicationRecord
  belongs_to :board
  has_many :tasks

  # def self.by_priority
  #   order(:priority)
  # end

  # def list_is_first
  #   self.priority === 0
  # end

  # def self.priority_when_added(board)
  #   @list = board.lists.new(list_params)
  #   lowest = board.lists.last('priority')
  #   @list.priority = lowest + 1
  # end 

  # def self.up_priority
  #   list_down_priority = @board.lists.find_by(priority: @list.priority - 1)
  #   @list.update(priority: list_down_priority.priority)
  #   list_down_priority.update(priority: list_down_priority + 1)
  # end

  # def self.down_priority
  #   list_up_priority = @board.lists.find_by(priority: @list.priority + 1)
  #   @list.update(priority: list_up_priority.priority)
  #   list_up_priority(priority: list_up_priority.priority - 1)
  # end
end