class Employee < ApplicationRecord
  belongs_to :address, dependent: :destroy # Relação com a tabela de endereços, exclui o endereço associado ao funcionário, quando o funcionário é deletado.
  belongs_to :position, foreign_key: :positions_id # Relação com a tabela de cargos, destacando que possui uma chave estrangeira chamada positions_id.
  accepts_nested_attributes_for :address # Informa que aceita os atributos de endereços de forma aninhada.

  validates :name, presence: true, length: 1..150 # Requer que nome seja preenchido e tenha de 1 até 150 caracteres.
  validates :birthdate, presence: true # Requer o preenchimento da data de nascimento.
  validates :cpf, presence: true, length: { is: 14 } # Requer que cpf seja preenchido e tenha exatamente 14 caracteres (númericos junto das pontuações)
  validates :rg, presence: true, length: { is: 11 } # Requer que rg seja preenchido e tenha exatamente 11 caracteres (númericos junto das pontuações)
  validates :email, presence: true # Requer que email seja preenchido
  validates :positions_id, presence: true # Requer que o funcionário tenha um endereço
  validates :hire_date, presence: true, comparison: { less_than_or_equal_to: Date.today } # Requer que a data de contratação seja preenchida e seja menor ou igual a data atual.

  validate :minimum_salary # Chama função que requer que o salário seja preenchido e seja maior ou igual ao salário base do cargo.

  private

  def minimum_salary # Função para verificar se o salário foi preenchido e se é maior ou igual ao salário base do cargo
    unless salary.nil?
      if position && salary < position.base_salary
        errors.add(:salary, "precisa ser maior ou igual ao salário base do cargo: " + position.base_salary.to_s)
      end
    else
      errors.add(:salary, "não pode ficar em branco.")
    end
  end
end
