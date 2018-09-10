require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'abilities' do
  it 'puts a task under a list' do
    name = 'Clean'
    task = Task.create(name: name)
    expect(task.name).to eq(name)
end
end
end