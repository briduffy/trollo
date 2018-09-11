require 'rails_helper'

RSpec.describe ListsController, type: :controller do

  let(:valid_attributes) {
    { name: 'whatever'}
  }

  describe "GET #index" do
    it "returns http success" do
      board = Board.create! valid_attributes
      get :index, params: {board_id: board.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      board = Board.create! valid_attributes
      list = board.lists.create! valid_attributes
      get :show, params: {board_id: board.id, id: list.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      board = Board.create! valid_attributes
      get :new, params: {board_id: board.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      board = Board.create! valid_attributes
      list = board.lists.create! valid_attributes
      get :edit, params: {board_id: board.id, id: list.id}
      expect(response).to have_http_status(:success)
    end
  end

end
