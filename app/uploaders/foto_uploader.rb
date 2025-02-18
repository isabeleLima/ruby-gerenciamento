class FotoUploader < CarrierWave::Uploader::Base
  storage :file

  # Define o diretório onde as imagens serão salvas
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Restringe os tipos de arquivos aceitos
  def extension_allowlist
    %w[jpg jpeg png]
  end

end 
