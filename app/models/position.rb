class Position < ApplicationRecord
  belongs_to :department # Relação com departamentos
  has_many :employees # Relação com funcionários

  before_destroy :set_default_position # Antes do cargo ser apagado é chamada função para setar cargo padrão ("Sem Cargo") para funcionários que tinham o cargo.

  private
  def set_default_position # Função que busca o cargo padrão e associa ao funcionário que possuia o cargo sendo removido.
    default_position = Position.find_by(name: "Sem Cargo")
    Employee.where(positions_id: self.id).update_all(positions_id: default_position.id)
  end
end
