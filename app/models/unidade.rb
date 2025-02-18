class Unidade < ApplicationRecord
    has_many :setor
    belongs_to :usuario, optional:true
    validates :usuario_id, presence: false  # Torna a chave estrangeira opcional
end
