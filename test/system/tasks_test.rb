require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in "Beginning date", with: @task.beginning_date
    fill_in "Email", with: @task.email
    fill_in "Ending date", with: @task.ending_date
    fill_in "Location", with: @task.location
    fill_in "Names", with: @task.names
    fill_in "Title", with: @task.title
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "updating a Task" do
    visit tasks_url
    click_on "Edit", match: :first

    fill_in "Beginning date", with: @task.beginning_date
    fill_in "Email", with: @task.email
    fill_in "Ending date", with: @task.ending_date
    fill_in "Location", with: @task.location
    fill_in "Names", with: @task.names
    fill_in "Title", with: @task.title
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "destroying a Task" do
    visit tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task was successfully destroyed"
  end
end
