class Department < ApplicationRecord
  has_many :positions # Relação com a tabela de cargos
  has_many :user_departments # Relação com a tabela de associação em si
  has_many :users, through: :user_departments # Relação de Departamento com usuários através da tabela de associação

  before_destroy :set_default_position_and_user_departments # Função é chamada antes da exclusão do departamento em questão

  private

  # Função utilizada apenas dentro do modelo de Departamento que associa o departamento padrão aos cargos e à tabela de associação
  # usuários e departamentos, antes da exclusão de um departamento.
  def set_default_position_and_user_departments
    # Associa o departamento padrão a default_department
    default_department = Department.find_by(name: "Sem Departamento")

    # Atualiza os cargos associados para o departamento padrão
    Position.where(department_id: self.id).update_all(department_id: default_department.id)

    # Para cada associação de usuário (na tabela user_departments), verifica se o usuário possui outros departamentos
    UserDepartment.where(department_id: self.id).find_each do |user_department|
      user = user_department.user
      if user.departments.count == 1
        # Se for o único departamento do usuário, é associado o departamento padrão a esse usuário.
        user_department.update(department_id: default_department.id)
      else
        # Caso contrário, apenas remove o departamento da associação em que estava.
        user_department.destroy
      end
    end
  end
end
