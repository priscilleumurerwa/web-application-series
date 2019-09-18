rails # In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  scenario "Test task list" do

  end

  scenario "Test task creation" do

  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
  end
  scenario "Test task details" do

  end
  scenario "Test task list" do
    # Create two tasks in advance to use in the task list test
    Task.create!(title: 'test_task_01', content: 'testtesttest')
    Task.create!(title: 'test_task_03', content: 'samplesample')
  
    # Test task list
  end
  
  # Omission
  
  scenario "Test whether tasks are arranged in descending order of creation date" do
    # Create two tasks in advance to use in the task sorting confirmation test
    # (The same description as above will be repeated!)
    Task.create!(title: 'test_task_01', content: 'testtesttest')
    Task.create!(title: 'test_task_03', content: 'samplesample')
  
    # Test whether tasks are arranged in descending order of creation date
  end
end