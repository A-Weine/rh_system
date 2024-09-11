class Address < ApplicationRecord
  has_many :employee # Relação com a tabela de empregados
end
