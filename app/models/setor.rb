class Setor < ApplicationRecord
  belongs_to :unidade
  has_many :funcionarios_setor  
  has_many :visitas
  has_many :usuarios, through: :funcionarios_setor
end
