class UserDepartment < ApplicationRecord
  belongs_to :user # Relação com usuários
  belongs_to :department # Relação com departamentos
end
