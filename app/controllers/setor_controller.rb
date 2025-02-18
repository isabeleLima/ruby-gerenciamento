class SetorController < ApplicationController
#SETOR_UNIDADE
    before_action :set_unidade
    before_action :set_setor, only: [:edit, :update,:destroy,:funcionarios ]
    load_and_authorize_resource
    def current_user
        current_usuario
    end
    
    def index
        @setor = @unidade.setor   # Busca os setores dessa unidade
        render "setor/index"
    end

    def new
        @setor = @unidade.setor.build
    end

    def create
        @setor = @unidade.setor.build(setor_params)

        if @setor.save
            redirect_to unidade_path(@unidade), notice: "Setor criado com sucesso!"
        else
            render :new
        end
    end

    def edit
       
    end

    def update
        if @setor.update(setor_params)
            redirect_to unidade_setor_index_path(@unidade), notice: 'Setor atualizado com sucesso!'
        else
            render :edit
        end
    end
    
    def destroy
        @setor.destroy
        redirect_to unidade_setor_index_path(@unidade), notice: 'Setor removido com sucesso.'
    end

    #SETOR-FUNCIONARIO
    def funcionarios
        @unidade = Unidade.find(params[:unidade_id])  # Busca a unidade pelo ID
        @setor = @unidade.setor.find(params[:id])  # Busca o setor dentro da unidade
        @funcionarios = @setor.usuarios
    end 

    def funcionarios_for_select
        Rails.logger.debug "DEBUG: estou entrando aq"
        setor = Setor.find(params[:id])
        funcionarios = setor.usuarios.where(role: 1).select(:id, :name) # Filtra por role se necessário
      
        render json: funcionarios
      end

    def new_funcionario
        @unidade = Unidade.find(params[:unidade_id])
        @setor = @unidade.setor.find(params[:id])
    end

    def add_funcionario
        @unidade = Unidade.find(params[:unidade_id])
        @setor = @unidade.setor.find(params[:id]) # Certifica que o setor pertence à unidade
        @funcionario = Usuario.find(params[:funcionario_id]) # Busca o funcionário pelo ID

        if FuncionariosSetor.create(setor: @setor, usuario: @funcionario)
            flash[:notice] = "Funcionário adicionado com sucesso!"
        else
            flash[:alert] = "Erro ao adicionar funcionário."
        end

        redirect_to funcionarios_unidade_setor_path(@unidade, @setor)
    end

    def remove_funcionario
        @setor = @unidade.setor.find(params[:id]) # Certifica que o setor pertence à unidade
        logger.debug "ID do funcionário setor: #{params}"
        funcionario_setor = FuncionariosSetor.find_by(setor_id: params[:id], usuario_id: params[:usuario_id])
            
        if funcionario_setor
            # Se o funcionario_setor não for nil (ou seja, foi encontrado)
            if funcionario_setor.destroy
              flash[:notice] = "Funcionário removido com sucesso!"
            else
              flash[:alert] = "Erro ao remover funcionário."
            end
          else
            # Se o funcionario_setor for nil (não encontrado)
            flash[:alert] = "Funcionário não encontrado."
          end
    
          redirect_to funcionarios_unidade_setor_path(@unidade, @setor)
    end
    

    private
        def set_unidade
            if(params[:unidade_id])
                @unidade = Unidade.find(params[:unidade_id])  # Encontra a unidade pelo ID
            end
        end

        def set_setor
            @setor = @unidade.setor.find(params[:id])
        end

        def setor_params
            params.require(:setor).permit(:name)
        end
end
