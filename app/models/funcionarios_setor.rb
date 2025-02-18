class FuncionariosSetor < ApplicationRecord
  belongs_to :setor
  belongs_to :usuario
end
