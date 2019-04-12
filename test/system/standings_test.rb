require "application_system_test_case"

class StandingsTest < ApplicationSystemTestCase
  setup do
    @standing = standings(:one)
  end

  test "visiting the index" do
    visit standings_url
    assert_selector "h1", text: "Standings"
  end

  test "creating a Standing" do
    visit standings_url
    click_on "New Standing"

    fill_in "Place", with: @standing.place
    fill_in "Score", with: @standing.score
    click_on "Create Standing"

    assert_text "Standing was successfully created"
    click_on "Back"
  end

  test "updating a Standing" do
    visit standings_url
    click_on "Edit", match: :first

    fill_in "Place", with: @standing.place
    fill_in "Score", with: @standing.score
    click_on "Update Standing"

    assert_text "Standing was successfully updated"
    click_on "Back"
  end

  test "destroying a Standing" do
    visit standings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Standing was successfully destroyed"
  end
end
