# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Cria um departamento padrão
default_department = Department.find_or_create_by!(
  code: "000",
  name: "Sem Departamento",
  description: "Departamento padrão para caso haja necessidade de apagar algum departamento sendo utilizado.",
  location: "N/",
  status: "Ativo"
)

# Cria um cargo padrão associado ao departamento padrão
default_position = Position.find_or_create_by!(
  name: "Sem Cargo",
  description: "Cargo padrão para caso haja necessidade de apagar algum cargo sendo utilizado.",
  department_id: default_department.id,
  level: "Não se aplica",
  base_salary: 0,
  requirements: "Nenhum",
  benefits: "Nenhum",
  status: "Ativo"
)
