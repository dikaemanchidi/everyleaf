json.extract! task, :id, :title, :content, :text, :created_at, :updated_at
json.url task_url(task, format: :json)
