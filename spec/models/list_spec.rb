require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'attributes' do
    it 'has a name' do
        name = 'Chores'
        list = List.create(name: name)
        expect(list.name).to eq(name)
    end
  end


  describe 'associations' do
    it { should belong_to :board }
    it { should have_many :tasks }
  end
end