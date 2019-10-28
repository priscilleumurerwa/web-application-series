# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "user management function", type: :feature do
# In scenario (alias of it), write the processing of the test for each item you want to check.
background do
 User.create!(name: "priscille", email: 'prisc@gmail.com', user_type: 'admin',  password: '123456', password_confirmation: '123456')
 visit  root_path
 #click_on 'Log in'
 fill_in  'Email' ,  with: 'priscille@gmail.com'
 fill_in  'Password' ,  with: '123456'
 click_on  'Log in'
end
scenario "Test number of users" do
 User.create!(name: 'priscille', email: 'priscille@gmail.com', user_type: 'admin', password: '123456')
 @user = User.all.count
 expect(@user).to eq 2
end
scenario "Test user list" do
 User.create!(name: 'priscille', email: 'priscille@gmail.com', user_type: 'admin', password: '123456')
 visit admin_users_path
 expect(page ).to  have_content  'priscille'
 expect(page ).to  have_content  'priscille'
end
scenario "Test user creation" do
 User.create!(name: 'priscille', email: 'priscille@gmail.com', user_type: 'admin', password: '123456')
 visit admin_users_path
 expect(page ).to  have_content  'priscille'
end
scenario "test enable user creation page" do
 visit admin_users_path
 expect(page ).to  have_content  'priscille'
end
scenario "Test user details" do
 @user= User.create!(name: 'priscille', email: 'priscille@gmail.com', user_type: 'admin', password: '123456')
 visit admin_user_path(id: @user.id)
  expect(page).to have_text('')

end
scenario "Test user updating" do
 @user = User.first
 visit edit_user_path(id: @user.id)
 if has_field?('name')
 fill_in 'name', with: 'name update'
 end
 #fill_in 'Content', with: 'content update'
 click_on 'Update user'
 visit admin_users_path
#  expect(page).to have_content 'name update'
 expect(page).to have_content('')
end
scenario 'Test user Deletion' do
 User.create!(name: 'umurerwa', email: 'umurerwa@gmail.com', user_type: 'admin', password: '123456')
 @user = User.last
 @user.destroy
 # expect(page).to have_content('testtesttest')
 # click_on 'Destroy'
 visit admin_users_path
 expect(page).not_to have_content('umurerwa')
end
end