require "application_system_test_case"

class ActivityCalendarsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url

    assert_selector "#activity-calendar"
  end
end
