Rails.application.routes.draw do
  devise_for :usuarios, skip: [:registrations]
  
    devise_scope :usuario do
    root to: "devise/sessions#new" 
    end

    # DASHBOARD
    get 'dashboard_atendente', to: 'paginas#dashboard_atendente'
    get 'dashboard_funcionario', to: 'paginas#dashboard_funcionario'
    get 'dashboard_admin', to: 'paginas#dashboard_admin'


    # USUARIO
    get 'usuarios', to: 'usuario#index'
    get 'usuarios/:id', to: 'usuario#show', as: :usuario
    get 'usuario/new', to: 'usuario#new', as: :new_usuario
    post 'usuarios', to: 'usuario#create'
    get 'usuarios/:id/edit', to: 'usuario#edit', as: :edit_usuario
    patch 'usuarios/:id', to: 'usuario#update'
    delete 'usuarios/:id', to: 'usuario#destroy'

    #VISITAS
    resources :visita, only: [:index, :new, :create, :show, :edit, :update]
    get 'funcionario/visita/edit/:id', to: 'visita#edit_funcionario_visita', as: :edit_funcionario_visita
    get 'funcionario/visita', to: 'visita#funcionario_visita'
    
    # VISITANTE

    get 'visitantes', to: 'visitante#index'
    get 'visitantes/busca_por_cpf', to: 'visitante#busca_por_cpf'
    get 'visitantes/:id', to: 'visitante#show', as: :visitante
    get 'visitante/new', to: 'visitante#new', as: :new_visitante
    post 'visitantes', to: 'visitante#create'
    get 'visitantes/:id/edit', to: 'visitante#edit', as: :edit_visitante
    patch 'visitantes/:id', to: 'visitante#update'
    delete 'visitantes/:id', to: 'visitante#destroy'

    # UNIDADE

    get 'unidades', to: 'unidade#index'
    get 'unidades/:id/new_atendente', to: 'unidade#new_atendente', as: :unidade_new_atendente
    get 'unidades/:id', to: 'unidade#show', as: :unidade
    get 'unidade/new', to: 'unidade#new', as: :new_unidade
    post 'unidades', to: 'unidade#create'
    patch 'unidade/:id/new_atendente', to: 'unidade#add_atendente', as: :unidade_add_atendente
    get 'unidades/:id/edit', to: 'unidade#edit', as: :edit_unidade
    patch 'unidades/:id', to: 'unidade#update'
    delete 'unidades/:id', to: 'unidade#destroy'
    
    #UNIDADE-SETOR
    resources :unidades do
      resources :setor, only: [:index, :new, :create, :edit, :update, :destroy] # Cria a rota index dentro de unidades
    end
    
    get 'setores/:id/funcionarios', to: 'setor#funcionarios_for_select'
    
    resources :unidades do
      resources :setor do
        get :funcionarios, on: :member # lista os funcionarios que ja estam cadastrados naquele setor
        get 'new_funcionario', on: :member # Para acessar a página de adição
        post 'add_funcionario', on: :member # Para salvar o funcionário no setor
        delete 'remove_funcionario', on: :member
      end
    end

    get 'error404', to: 'paginas#error404'
    match "/404", to: "paginas#error404", via: :all
  
end
