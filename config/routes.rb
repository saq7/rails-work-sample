Rails.application.routes.draw do

  root to: redirect('/nice-co/deployments/1234/postgresql/databases')

  scope '/:account_slug/deployments/:deployment_id' do
    namespace :postgresql do
      resources :databases, param: :name, only: [:index] do
        resources :schemas, param: :name, only: [:index] do
          resources :tables, param: :name, only: [:index] do
            resources :columns, param: :name, only: [:index]
          end
        end
      end
    end
  end
end
