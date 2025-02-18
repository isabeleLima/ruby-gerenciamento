class Visitum < ApplicationRecord
  belongs_to :visitante
  belongs_to :setor
  belongs_to :usuario, optional: true
end
