json.extract! task, :id, :name, :content, :status, :priority, :beginning_date, :ending_date, :created_at, :updated_at
json.url task_url(task, format: :json)
