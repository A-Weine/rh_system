class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable # Padrão do Devise

  has_many :user_departments, dependent: :destroy # Relação com tabela de associação de usuários com departamentos, destrói linhas caso o usuário seja deletado.
  has_many :departments, through: :user_departments # Relação com departamento através da tabela de associação

  enum access_level: { admin: "admin", hr_manager: "hr_manager" } # Cria enumeração com os valores de access_level

  # Define o metodo departamentos para Usuário e retorna todos os departamentos caso seja um admin ou os departamentos associados a ele se for um gestor.
  def departments
    if admin?
      Department.where.not(name: "Sem Departamento")
    else
      super
    end
  end
end
