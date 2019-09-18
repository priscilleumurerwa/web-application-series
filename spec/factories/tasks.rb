FactoryBot.define do
  factory :task do
    name { "MyString" }
    content { "MyString" }
    status { "MyString" }
    priority { "MyString" }
    beginning_date { "2019-09-16 23:12:49" }
    ending_date { "2019-09-16 23:12:49" }
    # Description "Use FactoryBot"

  # Name the test data to be created "task"
  # (If you name test data that matches the class name that actually exists, test data of that class will be created automatically)

    title { 'Default title 1 created by Factory' }
    content { 'Default content 1 created by Factory' }
  end

  # Name the test data to be created as "second_task"
  # (If you want to name a non-existent class name, optionally specify "Please make test data of this class")
  factory :second_task, class: Task do
    title { 'Default title 2 created by Factory' }
    content { 'Default content 2 created by Factory' }
  end
end
