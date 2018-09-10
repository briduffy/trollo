class List < ApplicationRecord
  belongs_to :board
  has_many :tasks

  def self.by_list
  end

end