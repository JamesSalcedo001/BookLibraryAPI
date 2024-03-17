Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

      resources :books do
        collection do
          get :search
          get :published_in_year
        end
        member do
          patch :publish
        end
      end


  get '*path',
  to: 'fallback#index',
  constraints: ->(req) { !req.xhr? && req.format.html? }
 
end

