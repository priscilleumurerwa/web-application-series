json.extract! task, :id, :names, :email, :location, :beginning_date, :title, :ending_date, :created_at, :updated_at
json.url task_url(task, format: :json)
