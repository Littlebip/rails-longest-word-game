require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "visiting /new page gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "filling the form with a random word will tell us that the word is not in the grid" do
    visit new_url
    fill_in 'word', with: "test"
    click_on 'Play'
    assert_text "can't be build out of"
  end
end
