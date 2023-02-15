require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get players_url, as: :json
    assert_response :success
  end

  test "should create player" do
    assert_difference("Player.count") do
      post players_url, params: { player: { x: @player.x, y: @player.y, z: @player.z } }, as: :json
    end

    assert_response :created
  end

  test "should show player" do
    get player_url(@player), as: :json
    assert_response :success
  end

  test "should update player" do
    patch player_url(@player), params: { player: { x: @player.x, y: @player.y, z: @player.z } }, as: :json
    assert_response :success
  end

  test "should destroy player" do
    assert_difference("Player.count", -1) do
      delete player_url(@player), as: :json
    end

    assert_response :no_content
  end
end
