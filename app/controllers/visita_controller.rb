class VisitaController < ApplicationController
    before_action :authenticate_usuario!  # Ou qualquer outro mecanismo de autenticação
    def current_user
        current_usuario
    end

    def visita_params
      # Permitir todos os parâmetros relevantes para mass-assignment
      params.require(:visitum).permit(:visitante_id, :usuario_id, :setor_id, :date, :status)
    end

    def index
        
        id = current_usuario.id  
        unidade_do_usuario = Unidade.find_by(usuario_id: id)
        
        setores_da_unidade = Setor.where(unidade_id: unidade_do_usuario.id)
        
        @visitas = Visitum.where(setor_id: setores_da_unidade.select(:id))
      
        @visitas_atrasadas =  @visitas.where("date < ?", Time.current)
        @visitas_pendentes =  @visitas.where("date >= ?", Time.current)
      end

      def funcionario_visita
        id = current_usuario.id  
        
        @visitas = Visitum.where(usuario_id:id)
        
        @visitas_atrasadas =  @visitas.where("date < ?", Time.current)
        @visitas_pendentes =  @visitas.where("date >= ?", Time.current)
      end

      def show  
        @visita = Visitum.find(params[:id])

        @setor = Setor.find(@visita.setor_id)

        if(@visita.usuario_id)
          @funcionario = Usuario.find(@visita.usuario_id)
        else
          @funcionario = nil
        end

        @visitante = Visitante.find(@visita.visitante_id)
      end
      

      def new
        @visitantes = Visitante.all  # Busca todos os visitantes
        @visita = Visitum.new         # Cria uma nova instância de Visitum

        id = current_usuario.id  # Assumindo que o usuário tem um setor_id
        unidade_id = Unidade.find_by(usuario_id: id)
        @setores = Setor.where(unidade_id: unidade_id.id)

      end

       def create
        @visita = Visitum.new(visita_params)

        # Caso o usuario_id seja 0, atribui nil ao campo usuario_id
        if params[:visitum][:usuario_id].to_i == 0
          @visita.usuario_id = nil
        end

        @visita.status = 1

        if @visita.save
          flash[:notice] = "Visita registrada com sucesso!"
          redirect_to visita_path(@visita)  # Redireciona para a página da visita
        else
          flash[:alert] = "Erro ao registrar visita."
          render :new
        end
      end

      def edit
        @visita = Visitum.find_by(id: params[:id])  # Tenta encontrar a visita pela ID

        if @visita.nil?
          flash[:alert] = "Visita não encontrada."
          redirect_to visitas_path  # Caso não encontre, redireciona
        end

        @visitantes = Visitante.all
        id = current_usuario.id
        unidade_id = Unidade.find_by(usuario_id: id)
        @setores = Setor.where(unidade_id: unidade_id.id)
      end
        
      
      def update
        @visita = Visitum.find(params[:id])
        
        if params[:visitum][:usuario_id].to_i == 0
          @visita.usuario_id = nil
        end
        
        if @visita.update(visita_params)
          flash[:notice] = "Visita atualizada com sucesso!"
          redirect_to visita_path(@visita)  # Redireciona para a página da visita
        else
          flash[:alert] = "Erro ao atualizar visita."
          render :edit
        end
      end
      end
  