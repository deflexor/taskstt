json.extract! task, :id, :title, :status, :ends_at, :deadline_at, :canceled_at, :completed_at, :created_at, :updated_at
json.url task_url(task, format: :json)
