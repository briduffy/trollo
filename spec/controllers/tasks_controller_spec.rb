require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  let(:valid_attributes) {
    { name: 'Chase'}
  }

  describe "GET #new" do
    it "returns http success" do
      board = Board.create! valid_attributes
      list = board.lists.create! valid_attributes
      get :new, params: { list_id: list.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      board = Board.create! valid_attributes
      list = board.lists.create! valid_attributes
      task = list.tasks.create! valid_attributes
      get :create, params: {list_id: list.id}
      expect(response).to have_http_status(:success)
    end
  end

end
