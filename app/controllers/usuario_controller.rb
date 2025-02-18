class UsuarioController < ApplicationController
    before_action :authenticate_usuario!  # Ou qualquer outro mecanismo de autenticação
    load_and_authorize_resource
    def current_user
        current_usuario
    end

    def index
        @usuario = Usuario.all
    end

    def show
        @usuario = Usuario.find(params[:id])
    end

    def new
        @usuario = Usuario.new
    end

    def create
        @usuario = Usuario.new(name: params[:usuario][:name], email: params[:usuario][:email], password_confirmation: params[:usuario][:password_confirmation], 
            password: params[:usuario][:password], role: params[:usuario][:role])
        if @usuario.save
            redirect_to usuario_path(@usuario) 
        else 
            render new
        end
    end

    def edit
        @usuario = Usuario.find(params[:id])
      end
    def update
    @usuario = Usuario.find(params[:id])
        if @usuario.update(name: params[:usuario][:name], email: params[:usuario][:email], password_confirmation: params[:usuario][:password_confirmation], 
            password: params[:usuario][:password], role: params[:usuario][:role])
            redirect_to usuario_path(@usuario)
        else
            render :edit
        end
    end
    def destroy
        @usuario = Usuario.find(params[:id])
        @usuario.destroy
      
        redirect_to usuarios_path
      end
      def usuario_params
        params.require(:usuario).permit(:name, :email, :password, :password_confirmation, :role)
      end
end
