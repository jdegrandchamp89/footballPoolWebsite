require 'test_helper'

class StandingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @standing = standings(:one)
  end

  test "should get index" do
    get standings_url
    assert_response :success
  end

  test "should get new" do
    get new_standing_url
    assert_response :success
  end

  test "should create standing" do
    assert_difference('Standing.count') do
      post standings_url, params: { standing: { place: @standing.place, score: @standing.score } }
    end

    assert_redirected_to standing_url(Standing.last)
  end

  test "should show standing" do
    get standing_url(@standing)
    assert_response :success
  end

  test "should get edit" do
    get edit_standing_url(@standing)
    assert_response :success
  end

  test "should update standing" do
    patch standing_url(@standing), params: { standing: { place: @standing.place, score: @standing.score } }
    assert_redirected_to standing_url(@standing)
  end

  test "should destroy standing" do
    assert_difference('Standing.count', -1) do
      delete standing_url(@standing)
    end

    assert_redirected_to standings_url
  end
end
