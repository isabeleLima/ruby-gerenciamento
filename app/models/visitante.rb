class Visitante < ApplicationRecord
    has_many :visitas
    mount_uploader :picture, FotoUploader   
end
