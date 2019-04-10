require 'test_helper'

class GamePicksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_pick = game_picks(:one)
  end

  test "should get index" do
    get game_picks_url
    assert_response :success
  end

  test "should get new" do
    get new_game_pick_url
    assert_response :success
  end

  test "should create game_pick" do
    assert_difference('GamePick.count') do
      post game_picks_url, params: { game_pick: { pickedteam: @game_pick.pickedteam, spread: @game_pick.spread, team1: @game_pick.team1, team2: @game_pick.team2, week: @game_pick.week } }
    end

    assert_redirected_to game_pick_url(GamePick.last)
  end

  test "should show game_pick" do
    get game_pick_url(@game_pick)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_pick_url(@game_pick)
    assert_response :success
  end

  test "should update game_pick" do
    patch game_pick_url(@game_pick), params: { game_pick: { pickedteam: @game_pick.pickedteam, spread: @game_pick.spread, team1: @game_pick.team1, team2: @game_pick.team2, week: @game_pick.week } }
    assert_redirected_to game_pick_url(@game_pick)
  end

  test "should destroy game_pick" do
    assert_difference('GamePick.count', -1) do
      delete game_pick_url(@game_pick)
    end

    assert_redirected_to game_picks_url
  end
end
