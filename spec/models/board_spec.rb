require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'attributes' do
    it 'has a name' do
      name = 'Chores Board'
      board = Board.create(name: name)
      expect(board.name).to eq(name)
    end
  end
end
