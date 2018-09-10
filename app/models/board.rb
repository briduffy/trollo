class Board < ApplicationRecord
  has_many :lists
  def self.by_board
  end
end
