json.extract! department, :id, :code, :name, :description, :location, :status, :created_at, :updated_at
json.url department_url(department, format: :json)
