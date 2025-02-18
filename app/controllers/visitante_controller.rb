class VisitanteController < ApplicationController
    before_action :authenticate_usuario!  # Ou qualquer outro mecanismo de autenticação
    load_and_authorize_resource
    def current_user
        current_usuario
    end

    def index
        @visitante = Visitante.all
    end

    def show
        @visitante = Visitante.find(params[:id])
    end

    def busca_por_cpf
        visitante = Visitante.find_by(cpf: params[:cpf])
        
        if visitante
          render json: { id: visitante.id, name: visitante.name }
        else
          render json: { error: "Visitante não encontrado" }, status: :not_found
        end
    end

    def new
        @visitante = Visitante.new
    end

    def create
        foto = parse_base64_image(params[:visitante][:picture])
        @visitante = Visitante.new(name: params[:visitante][:name], cpf: params[:visitante][:cpf], telephone: params[:visitante][:telephone], picture: foto)
        if @visitante.save
            redirect_to visitante_path(@visitante) 
        else 
            render new
        end
    end

    def edit
        @visitante = Visitante.find(params[:id])
      end
    def update
    @visitante = Visitante.find(params[:id])
        if @visitante.update(name: params[:visitante][:name], cpf: params[:visitante][:cpf], telephone: params[:visitante][:telephone])
            redirect_to visitante_path(@visitante)
        else
            render :edit
        end
    end

    def visitante_params
        params.require(:visitante).permit(:name, :cpf, :telephone,:picture)
      end

    def destroy
        @visitante = Visitante.find(params[:id])
        @visitante.destroy
      
        redirect_to visitantes_path
      end

      def parse_base64_image(base64_string)
        return nil unless base64_string.present?
    
        format, img_data = base64_string.split(";base64,")
        ext = format.split("/").last
        filename = "foto_#{Time.now.to_i}.#{ext}"
    
        decoded_data = Base64.decode64(img_data)
        file = Tempfile.new([filename, ".#{ext}"])
        file.binmode
        file.write(decoded_data)
        file.rewind
    
        ActionDispatch::Http::UploadedFile.new(
          filename: filename,
          type: "image/#{ext}",
          tempfile: file
        )
      end

end
