require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all games to @games' do
      game = create(:game) # Assuming you have a factory for Game
      get :index
      expect(assigns(:games)).to eq([game])
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      game = create(:game)
      get :show, params: { id: game.id }
      expect(response).to be_successful
    end

    it 'assigns the requested game to @game' do
      game = create(:game)
      get :show, params: { id: game.id }
      expect(assigns(:game)).to eq(game)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new game' do
        expect {
          post :create, params: { game: attributes_for(:game) }
        }.to change(Game, :count).by(1)
      end

      it 'returns a created response' do
        post :create, params: { game: attributes_for(:game) }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new game' do
        expect {
          post :create, params: { game: { title: nil } }
        }.not_to change(Game, :count)
      end

      it 'returns an unprocessable entity response' do
        post :create, params: { game: { title: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end