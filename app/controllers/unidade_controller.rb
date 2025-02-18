class UnidadeController < ApplicationController
    before_action :authenticate_usuario!  # Ou qualquer outro mecanismo de autenticação
    load_and_authorize_resource
    def current_user
        current_usuario
    end

    def index
        @unidade = Unidade.all
    end

    def show
        @unidade = Unidade.find(params[:id])

        if(@unidade.usuario_id)
            @atendente = Usuario.find(@unidade.usuario_id) # Busca o funcionário pelo ID
        end
    end

    def new
        @unidade = Unidade.new
    end
    
    def create
        @unidade = Unidade.new(name: params[:unidade][:name])
        if @unidade.save
            redirect_to unidade_path(@unidade) 
        else 
            render new
        end
    end

        def unidade_params
        params.require(:unidade).permit(:name)
        end

    def edit
        @unidade = Unidade.find(params[:id])
    end

    def update
    @unidade = Unidade.find(params[:id])
        if @unidade.update(name: params[:unidade][:name])
            redirect_to unidade_path(@unidade)
        else
            render :edit
        end
    end
    
    def destroy
        @unidade = Unidade.find(params[:id])
        @unidade.destroy
      
        redirect_to unidades_path
    end

    def new_atendente
        puts params.inspect  # Isso imprimirá os parâmetros no log do servidor
        @unidade = Unidade.find(params[:id])
    end

    def add_atendente
        puts params.inspect
        @unidade = Unidade.find(params[:id])
        @funcionario = Usuario.find(params[:atendente_id]) # Busca o funcionário pelo ID    

        if @unidade.update(usuario_id: params[:atendente_id])
            redirect_to unidade_path(@unidade)
        else
            render new
        end
    end

 
end
