class PlayersController < ApplicationController
  before_action :set_player, only: %i[show update destroy]

  # GET /players
  def index
    @players = Player.all

    render json: @players
  end

  # GET /players/1
  def show
    # return x, y, z
    render json: { x: @player.x, y: @player.y, z: @player.z }
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def save_location
    @player = Player.find_or_create_by(id: params[:id])
    @player.update(player_params.except(:id))
    render json: @player
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def player_params
    data = JSON.parse(params['data'])
    params = ActionController::Parameters.new(data)
    params.require(:player).permit(:x, :y, :z)
  end
end
