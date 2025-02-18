class Ability
    include CanCan::Ability
  
    def initialize(usuario)
      # O usuário pode acessar o que for autorizado
      return unless usuario.present?  # Verifica se o usuário está logado
  
      # Exemplo: Atribuindo permissões de acordo com a role
      case usuario.role
      when 3
        # O admin pode fazer qualquer coisa
        can :manage, :all
       
      when 2
        # O gerente pode gerenciar apenas as visitas e setores
        can :manage, Visitum 
        can :manage, Setor
        can :manage, Visitante
      when 1
        # O funcionário pode apenas visualizar visitas e setores
        can :manage, Visitum
      else
        # Usuários sem role ou com roles desconhecidas podem não ter permissão para nada
        cannot :manage, :all
      end
    end
  end
  