class ApplicationController < ActionController::Base
  allow_browser versions: :modern


  def after_sign_in_path_for(resource)
    case resource.role
    when 1  # Funcionario
      dashboard_funcionario_path 
    when 2  # Atendente
      dashboard_atendente_path 
    when 3  # Admin
      dashboard_admin_path
    else
      root_path  # Caso não tenha um papel definido, redireciona para a página inicial
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_usuario_session_path # Redireciona para a página de login do Devise
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to error404_path
  end

end
