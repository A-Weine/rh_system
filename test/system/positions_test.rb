require "application_system_test_case"

class PositionsTest < ApplicationSystemTestCase
  setup do
    @position = positions(:one)
  end

  test "visiting the index" do
    visit positions_url
    assert_selector "h1", text: "Positions"
  end

  test "should create position" do
    visit positions_url
    click_on "New position"

    fill_in "Base salary", with: @position.base_salary
    fill_in "Benefits", with: @position.benefits
    fill_in "Department", with: @position.department_id
    fill_in "Description", with: @position.description
    fill_in "Level", with: @position.level
    fill_in "Name", with: @position.name
    fill_in "Requirements", with: @position.requirements
    fill_in "Status", with: @position.status
    click_on "Create Position"

    assert_text "Position was successfully created"
    click_on "Back"
  end

  test "should update Position" do
    visit position_url(@position)
    click_on "Edit this position", match: :first

    fill_in "Base salary", with: @position.base_salary
    fill_in "Benefits", with: @position.benefits
    fill_in "Department", with: @position.department_id
    fill_in "Description", with: @position.description
    fill_in "Level", with: @position.level
    fill_in "Name", with: @position.name
    fill_in "Requirements", with: @position.requirements
    fill_in "Status", with: @position.status
    click_on "Update Position"

    assert_text "Position was successfully updated"
    click_on "Back"
  end

  test "should destroy Position" do
    visit position_url(@position)
    click_on "Destroy this position", match: :first

    assert_text "Position was successfully destroyed"
  end
end
