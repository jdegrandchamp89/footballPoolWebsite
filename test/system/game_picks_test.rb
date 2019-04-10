require "application_system_test_case"

class GamePicksTest < ApplicationSystemTestCase
  setup do
    @game_pick = game_picks(:one)
  end

  test "visiting the index" do
    visit game_picks_url
    assert_selector "h1", text: "Game Picks"
  end

  test "creating a Game pick" do
    visit game_picks_url
    click_on "New Game Pick"

    fill_in "Pickedteam", with: @game_pick.pickedteam
    fill_in "Spread", with: @game_pick.spread
    fill_in "Team1", with: @game_pick.team1
    fill_in "Team2", with: @game_pick.team2
    fill_in "Week", with: @game_pick.week
    click_on "Create Game pick"

    assert_text "Game pick was successfully created"
    click_on "Back"
  end

  test "updating a Game pick" do
    visit game_picks_url
    click_on "Edit", match: :first

    fill_in "Pickedteam", with: @game_pick.pickedteam
    fill_in "Spread", with: @game_pick.spread
    fill_in "Team1", with: @game_pick.team1
    fill_in "Team2", with: @game_pick.team2
    fill_in "Week", with: @game_pick.week
    click_on "Update Game pick"

    assert_text "Game pick was successfully updated"
    click_on "Back"
  end

  test "destroying a Game pick" do
    visit game_picks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game pick was successfully destroyed"
  end
end
