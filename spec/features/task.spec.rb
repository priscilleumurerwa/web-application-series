# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
# In scenario (alias of it), write the processing of the test for each item you want to check.
  scenario "Test task list" do
    Task.create!(name: 'test_task_1', content: 'testtesttest',status: 'started',priority: 'medium', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    Task.create!(name: 'test_task_2', content: 'samplesample',status: 'completed',priority: 'high', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    visit tasks_path
    save_and_open_page
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end
  scenario "Test task creation" do
    # visit to new_task_path (transition to task registration page)
    visit new_task_path
    # In the input field labeled "Task Name" and in the input field labeled "Task Details"
    # Fill in the task title and content respectively
    Task.create!(name: 'test_task_1', content: 'testtesttest',status: 'started',priority: 'medium', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    Task.create!(name: 'test_task_2', content: 'samplesample',status: 'completed',priority: 'high', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    # Click_on a button with a value (notation letter) of “Register”
    
    fill_in  'Name' ,  with: 'completed'
   fill_in  'Content' ,  with: 'ruby task'
   # Click_on a button with a value (notation letter) of “Register”
   click_on  '登録する'
   # Check if the information that is supposed to be registered by click is displayed on the task detail page
   # (Assumption that transition to the task details screen will be made if the task is registered)
   expect(page ).to  have_content  'ruby task'


    
    # Check if the information that is supposed to be registered by click is displayed on the task detail page
    # (Assumption that transition to the task details screen will be made if the task is registered)
    #expect(page).to  have_content('testtesttest')
  end
  scenario "Test task details" do
    @task = Task.create!(name: 'test_task_01', content: 'testtesttest',status: 'started',priority: 'medium', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    visit task_path(id: @task.id)
    expect(page).to have_content('test_task_01')
    expect(page).to have_content('testtesttest')
  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.create!(name: 'test_task_01', content: 'testtesttest',status: 'started',priority: 'medium', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    Task.create!(name: 'test_task_02', content: 'samplesample',status: 'completed',priority: 'high', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    @task = Task.order('created_at ASC')
  end
  scenario "Test task updating" do
    task1=Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'started',priority: 'medium', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    visit edit_task_path(id: task1.id)
    fill_in 'Name', with: 'name update'
    fill_in 'Content', with: 'task update'
    click_on '更新する'
    visit tasks_path
    expect(page).to have_content('name update')
    expect(page).to have_content('task update')
  end
  scenario 'Test Task Deletion' do
    Task.create!(name: 'test_task_01', content: 'testtesttest',status: 'started',priority: 'medium', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    visit tasks_path
    expect(page).to have_content('testtesttest')
    click_on 'Destroy'
    expect(page).not_to have_content('testtesttest')
  end
end

