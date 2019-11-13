# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
# In scenario (alias of it), write the processing of the test for each item you want to check.
background do
  User.create!(name: "priscille", email: 'prisc@gmail.com', user_type: 'admin',  password: '123456')
  visit  root_path
  #click_on 'Login'
  fill_in  'Email' ,  with: 'prisc@gmail.com'
  fill_in  'Password' ,  with: '123456'
  click_on  'Log in'
  expect(page).to have_text ('')
  #click_on 'New Task'
    #fill_in  'Name' ,  with: 'task1'
    #fill_in  'Content' ,  with: 'content1'
    # fill_in  'Status' ,  with: 'status1'
    # fill_in  'Priority' ,  with: 'Priority1'
    #click_on 'Unda'
end
  scenario "Test task list" do
#     visit root_path
#     Task.create(name: "web", content: "testtesttest", beginning_date: "10,12,2019",ending_date: "12,12,2019",priority:"medium",status: "done")
#   fill_in  'Email',  with: 'pri@gmail.Com'
#   fill_in  'Password' ,  with: '123456'
#   click_on  'Log in'
# expect(page).to have_text('')
   visit  new_task_path
   fill_in  'Name' ,  with: 'web'
   fill_in  'Content' ,  with: 'testtesttest'
   click_on '登録する'
   expect(page).to have_content 'testtesttest'
    # Task.create!(name: 'test_task_1', content: 'testtesttest',status: 'started',priority: 'medium', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    # #Task.create!(name: 'test_task_2', content: 'samplesample',status: 'completed',priority: 'high', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    # visit tasks_path
    # save_and_open_page
    # expect(page).to have_content 'testtesttest'
    #expect(page).to have_content 'samplesample'
  end
  scenario "Test task creation" do
    # visit to new_task_path (transition to task registration page)
    visit new_task_path
    # In the input field labeled "Task Name" and in the input field labeled "Task Details"
    # Fill in the task title and content respectively
    # Task.create!(name: 'test_task_1', content: 'testtesttest',status: 'started',priority: 'medium', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    # Task.create!(name: 'test_task_2', content: 'samplesample',status: 'completed',priority: 'high', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    # Click_on a button with a value (notation letter) of “Register”
    
    fill_in  'Name' ,  with: 'completed'
   fill_in  'Content' ,  with: 'ruby task'
   # Click_on a button with a value (notation letter) of “Register”
   click_on  '登録する'
    
    # Check if the information that is supposed to be registered by click is displayed on the task detail page
    # (Assumption that transition to the task details screen will be made if the task is registered)
    #expect(page).to  have_content('testtesttest')
  end
  scenario "Test task details" do
    #@task = Task.create!(name: 'test_task_01', content: 'testtesttest',status: 'started',priority: 'medium', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    visit  new_task_path
    fill_in  'Name' ,  with: 'completed'
   fill_in  'Content' ,  with: 'ruby task'
   # Click_on a button with a value (notation letter) of “Register”
   click_on  '登録する'
   @task = Task.first
    visit task_path(id: @task.id)
    expect(page).to have_content('ruby task')
    expect(page).to have_content('ruby task')
  end 

  scenario "Test whether tasks are sorted by priority" do
    visit  new_task_path
   Task.create(name: "web", content: "testtest", beginning_date: "10,12,2019",ending_date: "12,12,2019",priority:"medium",status: "done")
   Task.order("priority asc")
  end

  scenario "Test whether tasks are arranged by deadline" do
    visit  new_task_path
   Task.create(name: "web", content: "testtest", beginning_date: "10,12,2019",ending_date: "12,12,2019",priority:"medium",status: "done")
   Task.order("ending_date asc")
  end

  scenario "Test whether tasks are arranged in descending order of creation date" do
    # Task.create!(name: 'test_task_01', content: 'testtesttest',status: 'started',priority: 'medium', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    # Task.create!(name: 'test_task_02', content: 'samplesample',status: 'completed',priority: 'high', beginning_date: '10.2.2019', ending_date: '20.10.2019')
    visit  new_task_path
    fill_in  'Name' ,  with: 'completed'
    fill_in  'Content' ,  with: 'ruby task'
   # Click_on a button with a value (notation letter) of “Register”
   click_on  '登録する'
    @task = Task.order('created_at ASC')
  end
  scenario "test task search by attached labels " do
    # Task.create(name: "web", content: "testtest", beginning_date: "10,12,2019",ending_date: "12,12,2019",priority:"medium",status: "done")
    visit new_task_path
    fill_in  'Name' ,  with: 'completed'
   fill_in  'Content' ,  with: 'label task'
   # Click_on a button with a value (notation letter) of “Register”
   click_on  '登録する'

    visit new_label_path
    fill_in 'Name', with: 'label name1'
    fill_in 'Details', with: 'label detail1'
    click_on '登録する'
    
    visit new_label_path
    fill_in 'Name', with: 'label name2'
    fill_in 'Details', with: 'label detail2'
    click_on '登録する'
    @task = Task.first
    @label1 = Label.first
    @label2 = Label.last
    @task.labels = [@label1,@label2]
    @task.save
    visit tasks_path
    fill_in  'term1' ,  with: 'label name1'
    click_on '  Search'
    expect(page).to have_content('label task')
  end
 
end

