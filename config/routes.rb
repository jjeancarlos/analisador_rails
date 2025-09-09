Rails.application.routes.draw do
  # Define a rota raiz ("/") para a action 'new' do controller 'analyses'
  root "analyses#new"

  # Cria as rotas para index, new e create usando o padrão RESTful
  resources :analyses, only: [:index, :new, :create]

  # Verifica o status da aplicação em /up
  get "up" => "rails/health#show", as: :rails_health_check

  # Renderiza arquivos dinâmicos de PWA (descomente se for usar)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
