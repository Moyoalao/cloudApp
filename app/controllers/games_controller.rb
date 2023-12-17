# games controller
# frozen_string_literal: true

# game controller
class GamesController < ApplicationController
  before_action :set_game, only: %i[show update destroy]


  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    # puts "Received parameters: #{params.inspect}"
    params[:game][:status] ||= 'will_play'
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: { errors: @game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    # @game = Game.find(params[:id])
    if @game.update(game_params)
      render json: @game
    else
      render json: { errors: @game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    # @game = Game.find(params[:id])
    @game.destroy
    head :no_content
  end

  def delete_game
    @game = Game.find_by(id: params[:id])

    if @game
      @game.destroy
      head :no_content
    else
      render json: { error: 'Game not found' }, status: :not_found
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:title, :status, :hours_played)
  end
end
