json.extract! employee, :id, :name, :birthdate, :gender, :cpf, :rg, :address_id, :phone, :email, :position, :hire_date, :salary, :status, :created_at, :updated_at
json.url employee_url(employee, format: :json)
